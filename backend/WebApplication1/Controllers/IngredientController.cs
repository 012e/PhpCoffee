using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Database;
using WebApplication1.Dtos.Mappers;
using WebApplication1.Dtos.Requests;
using WebApplication1.Helpers;
using WebApplication1.Services;

namespace WebApplication1.Controllers;

[Route("[controller]/")]
[ApiController]
public class IngredientController : ControllerBase
{
    // Các dependency được inject thông qua constructor
    // Đây là ví dụ về Dependency Injection Pattern, giúp giảm sự phụ thuộc và tăng khả năng test
    private readonly ApplicationDbContext _context;
    private readonly IngredientImageService _ingredientImageService;
    private readonly IngredientMapper _ingredientMapper;

    /// <summary>
    /// Constructor của IngredientController
    /// </summary>
    /// <param name="context">DbContext để tương tác với cơ sở dữ liệu</param>
    /// <param name="ingredientMapper">Mapper để chuyển đổi giữa các entity và DTO</param>
    public IngredientController(ApplicationDbContext context,
        IngredientMapper ingredientMapper,
        IngredientImageService ingredientImageService)
    {
        _context = context;
        _ingredientMapper = ingredientMapper;
        _ingredientImageService = ingredientImageService;
    }

    /// <summary>
    /// Lấy danh sách tất cả các nguyên liệu
    /// GET /Ingredient
    /// </summary>
    /// <returns>Danh sách các đối tượng IngredientResponse</returns>
    /// <remarks>
    /// Phương pháp tốt nhất:
    /// 1. Sử dụng HTTP GET cho các operation lấy dữ liệu
    /// 2. Sử dụng [ProducesResponseType] để mô tả rõ kiểu dữ liệu trả về và status code
    /// 3. Trả về ActionResult<T> để có thể trả về nhiều loại phản hồi khác nhau
    /// 4. Sử dụng các method bất đồng bộ (async/await) để tăng hiệu suất và khả năng mở rộng
    /// 5. Sử dụng Include() để tải sẵn các đối tượng liên quan (eager loading)
    /// 6. Sử dụng Ok() để trả về status code 200 với dữ liệu
    /// 7. Sử dụng mapper để chuyển đổi từ entity sang DTO, tránh lộ thông tin nhạy cảm
    /// </remarks>
    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<IngredientResponse>),
        StatusCodes.Status200OK)] // Trả về 200 kèm theo dữ liệu nếu thành công
    public async Task<ActionResult<IEnumerable<IngredientResponse>>> GetIngredients()
    {
        // Lấy tất cả ingredients từ database, bao gồm cả thông tin về supplier
        var ingredients = await _context.Ingredients
            .Include(x => x.Supplier) // Eager loading để tải sẵn thông tin Supplier
            .ToListAsync(); // Thực thi truy vấn và chuyển kết quả thành List

        // Chuyển đổi từ entity sang DTO trước khi trả về cho client
        return Ok(_ingredientMapper.IngredientsToIngredientResponses(ingredients));
    }

    /// <summary>
    /// Thêm một nguyên liệu mới
    /// POST /Ingredient
    /// </summary>
    /// <param name="createIngredientRequest">Thông tin nguyên liệu cần tạo</param>
    /// <returns>Thông tin nguyên liệu vừa được tạo</returns>
    /// <remarks>
    /// Phương pháp tốt nhất:
    /// 1. Sử dụng HTTP POST cho các operation tạo mới dữ liệu
    /// 2. Định nghĩa rõ kiểu dữ liệu đầu vào là một DTO (CreateIngredientRequest)
    /// 3. Sử dụng mapper để chuyển đổi từ DTO sang entity
    /// 4. Sử dụng SaveChangesAsync() để lưu thay đổi vào database một cách bất đồng bộ
    /// 5. Sử dụng CreatedAtAction() để trả về status code 201 (Created) với URI của resource mới
    /// 6. Trả về thông tin đối tượng vừa tạo cho client
    /// 7. Nên thêm [ProducesResponseType] để mô tả rõ kiểu dữ liệu trả về và status code
    /// </remarks>
    [HttpPost]
    [ProducesResponseType(typeof(IngredientResponse),
        StatusCodes.Status201Created)] // Trả về 201 kèm theo dữ liệu nếu thành công
    [ProducesResponseType(StatusCodes.Status400BadRequest)] // Trả về 400 nếu có lỗi trong dữ liệu đầu vào
    public async Task<ActionResult<Ingredient>> AddIngredient(CreateIngredientRequest createIngredientRequest)
    {
        if (createIngredientRequest.SupplierId is not null && !SupplierExists(createIngredientRequest.SupplierId))
        {
            return BadRequest(new ProblemDetails
            {
                Detail = "Supplier not found",
                Title = "Invalid Supplier ID",
                Status = 400,
            });
        }

        // Chuyển đổi từ DTO sang entity
        var newIngredient = _ingredientMapper.CreateIngredientRequestToIngredient(createIngredientRequest);

        // Thêm entity vào DbContext
        _context.Ingredients.Add(newIngredient);

        // Lưu thay đổi vào database
        await _context.SaveChangesAsync();

        // Chuyển đổi từ entity sang DTO trước khi trả về cho client
        var response = _ingredientMapper.IngredientToIngredientResponse(newIngredient);

        // Trả về status code 201 (Created) với URI của resource mới và thông tin đối tượng
        return CreatedAtAction(nameof(GetIngredientById), new { id = newIngredient.IngredientId }, response);
    }

    private bool SupplierExists(int? supplierId)
    {
        // Kiểm tra xem supplier có tồn tại trong database hay không
        return _context.Suppliers.Any(e => e.SupplierId == supplierId);
    }

    /// <summary>
    /// Lấy thông tin một nguyên liệu theo ID
    /// GET /Ingredient/{id}
    /// </summary>
    /// <param name="id">ID của nguyên liệu cần lấy thông tin</param>
    /// <returns>Thông tin nguyên liệu hoặc NotFound nếu không tìm thấy</returns>
    /// <remarks>
    /// Phương pháp tốt nhất:
    /// 1. Sử dụng HTTP GET với tham số đường dẫn cho việc lấy dữ liệu theo ID
    /// 2. Định nghĩa rõ tham số đường dẫn bằng [HttpGet("{id}")]
    /// 3. Sử dụng [ProducesResponseType] để mô tả rõ kiểu dữ liệu trả về và status code
    /// 4. Xử lý trường hợp không tìm thấy bằng cách trả về NotFound()
    /// 5. Sử dụng FirstOrDefaultAsync() thay vì FindAsync() khi cần Include() các thuộc tính liên quan
    /// 6. Sử dụng ProblemDetails để cung cấp thông tin chi tiết về lỗi
    /// 7. Sử dụng mapper để chuyển đổi từ entity sang DTO trước khi trả về cho client
    /// </remarks>
    [HttpGet("{id}")]
    [ProducesResponseType(typeof(IngredientResponse),
        StatusCodes.Status200OK)] // Trả về 200 kèm theo dữ liệu nếu thành công
    [ProducesResponseType(StatusCodes.Status404NotFound)] // Trả về 404 nếu không tìm thấy
    public async Task<ActionResult<IngredientResponse>> GetIngredientById(int id)
    {
        // Tìm ingredient theo ID, bao gồm cả thông tin về supplier
        var ingredient = await _context.Ingredients
            .Include(x => x.Supplier) // Eager loading để tải sẵn thông tin Supplier
            .FirstOrDefaultAsync(x => x.IngredientId == id); // Tìm theo ID

        // Xử lý trường hợp không tìm thấy
        if (ingredient == null)
        {
            return NotFound(new ProblemDetails()
            {
                Detail = "Ingredient not found", // Thông báo lỗi
                // Nên bổ sung thêm các thông tin như:
                // Title = "Resource Not Found",
                // Status = 404,
                // Type = "https://tools.ietf.org/html/rfc7231#section-6.5.4"
            });
        }

        // Chuyển đổi từ entity sang DTO trước khi trả về cho client
        return _ingredientMapper.IngredientToIngredientResponse(ingredient);
    }

    [HttpPatch("{id}")]
    [ProducesResponseType(typeof(IngredientResponse),
        StatusCodes.Status200OK)] // Trả về 200 kèm theo dữ liệu nếu thành công
    [ProducesResponseType(StatusCodes.Status404NotFound)] // Trả về 404 nếu không tìm thấy
    [ProducesResponseType(StatusCodes.Status400BadRequest)] // Trả về 400 nếu có lỗi trong dữ liệu đầu vào
    public async Task<ActionResult<IngredientResponse>> UpdateIngredient(int id,
        UpdateIngredientRequest updateIngredientRequest)
    {
        if (updateIngredientRequest.SupplierId is not null && !SupplierExists(updateIngredientRequest.SupplierId))
        {
            return BadRequest(new ProblemDetails
            {
                Detail = "Supplier not found",
                Title = "Invalid Supplier ID",
                Status = 400,
                Type = "https://tools.ietf.org/html/rfc7231#section-6.5.1"
            });
        }

        // Tìm ingredient theo ID
        var ingredient = await _context
            .Ingredients
            .Include(x => x.Supplier)
            .FirstOrDefaultAsync(x => x.IngredientId == id);

        // Xử lý trường hợp không tìm thấy
        if (ingredient == null)
        {
            return NotFound(new ProblemDetails
            {
                Detail = $"Ingredient with ID {id} not found",
                Title = "Resource Not Found",
                Status = 404,
                Type = "https://tools.ietf.org/html/rfc7231#section-6.5.4"
            });
        }

        // Cập nhật thông tin từ DTO vào entity
        _ingredientMapper.UpdateIngredientFromRequest(updateIngredientRequest, ingredient);

        // Đánh dấu entity đã được sửa đổi
        _context.Entry(ingredient).State = EntityState.Modified;

        try
        {
            // Lưu thay đổi vào database
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            // Xử lý lỗi khi có nhiều người cùng cập nhật một resource
            if (!await IngredientExists(id))
            {
                return NotFound();
            }

            throw;
        }

        // Chuyển đổi từ entity sang DTO trước khi trả về cho client
        return Ok(_ingredientMapper.IngredientToIngredientResponse(ingredient));
    }

    /// <summary>
    /// Kiểm tra sự tồn tại của nguyên liệu theo ID
    /// </summary>
    /// <param name="id">ID của nguyên liệu cần kiểm tra</param>
    /// <returns>True nếu tồn tại, False nếu không</returns>
    private async Task<bool> IngredientExists(int id)
    {
        return await _context.Ingredients.AnyAsync(e => e.IngredientId == id);
    }

    /// <summary>
    /// Xóa một nguyên liệu theo ID
    /// DELETE /Ingredient/{id}
    /// </summary>
    /// <param name="id">ID của nguyên liệu cần xóa</param>
    /// <returns>NoContent nếu xóa thành công, NotFound nếu không tìm thấy</returns>
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)] // Trả về 204 nếu xóa thành công
    [ProducesResponseType(StatusCodes.Status404NotFound)] // Trả về 404 nếu không tìm thấy
    public async Task<IActionResult> DeleteIngredient(int id)
    {
        var ingredient = await _context.Ingredients.FindAsync(id);
        if (ingredient == null)
        {
            return NotFound(new ProblemDetails
            {
                Detail = $"Ingredient with ID {id} not found",
                Title = "Resource Not Found",
                Status = 404,
                Type = "https://tools.ietf.org/html/rfc7231#section-6.5.4"
            });
        }

        _context.Ingredients.Remove(ingredient);
        await _context.SaveChangesAsync();

        return NoContent();
    }

    [HttpPut("{id}/image")]
    [ProducesResponseType(StatusCodes.Status200OK)] // Trả về 200 nếu thành công
    [ProducesResponseType(StatusCodes.Status400BadRequest)] // Trả về 400 nếu có lỗi trong dữ liệu đầu vào
    [ProducesResponseType(StatusCodes.Status404NotFound)] // Trả về 404 nếu không tìm thấy
    public async Task<IActionResult> UploadImage(int id, IFormFile file)
    {
        if (file.Length == 0)
        {
            return BadRequest(new ProblemDetails
            {
                Detail = "File is empty",
                Title = "Invalid File",
                Status = 400,
                Type = "https://tools.ietf.org/html/rfc7231#section-6.5.1"
            });
        }

        var ingredient = await _context.Ingredients.FindAsync(id);
        if (ingredient == null)
        {
            return NotFound(new ProblemDetails
            {
                Detail = $"Ingredient with ID {id} not found",
                Title = "Resource Not Found",
                Status = 404,
                Type = "https://tools.ietf.org/html/rfc7231#section-6.5.4"
            });
        }

        var imageUrl = await _ingredientImageService.UpsertIngredientImageAsync(file, ingredient.IngredientId);

        ingredient.ImageUrl = imageUrl;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch
            (DbUpdateConcurrencyException)
        {
            if (!await IngredientExists(id))
            {
                return NotFound(new ProblemDetails
                {
                    Detail = $"Ingredient with ID {id} not found",
                    Title = "Resource Not Found",
                    Status = 404,
                    Type = "https://tools.ietf.org/html/rfc7231#section-6.5.4"
                });
            }

            throw;
        }


        return Ok(new Success("File Uploaded"));
    }
}