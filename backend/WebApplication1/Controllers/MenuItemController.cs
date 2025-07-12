using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Database;
using WebApplication1.Dtos.Mappers;
using WebApplication1.Dtos.Requests.MenuItem;
using WebApplication1.Helpers;
using ClosedXML.Excel;
namespace WebApplication1.Controllers;

[Route("[controller]")]
[ApiController]
public class MenuItemController : ControllerBase
{
    private readonly ApplicationDbContext _context;
    private readonly MenuItemMapper _menuItemMapper;
    public MenuItemController(ApplicationDbContext context, MenuItemMapper menuItemMapper)
    {
        _context = context;
        _menuItemMapper = menuItemMapper;
    }
    //Lấy tất cả
    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<MenuItemResponse>),
        StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<MenuItemResponse>>> GetMenuItems()
    {
        var menuItems = await _context.MenuItems.ToListAsync();
        return Ok(_menuItemMapper.MenuItemsToMenuItemResponses(menuItems));
    }
    //Lấy phần tử theo id 
    [HttpGet("{id}")]
    [ProducesResponseType(typeof(MenuItemResponse),
        StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<ActionResult<MenuItemResponse>> GetMenuItem(int id)
    {
        var menuItem = await _context.MenuItems.FindAsync(id);
        if (menuItem == null)
        {
            return NotFound();
        }
        return Ok(_menuItemMapper.MenuItemToMenuItemResponse(menuItem));
    }
    //Thêm mới 1 item
    [HttpPost]
    [ProducesResponseType(typeof(MenuItemResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<MenuItem>> CreateMenuItem(CreateMenuItemRequest menuItemRequest)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();
        try
        {
            var newRecipe = _menuItemMapper.CreateRecipeInMenu(menuItemRequest.Recipe);
            _context.Recipes.Add(newRecipe);
            await _context.SaveChangesAsync();
            var newItem = _menuItemMapper.CreateMenuItemRequestToMenuItem(menuItemRequest);
            newItem.RecipeId = newRecipe.Id;
            _context.MenuItems.Add(newItem);
            await _context.SaveChangesAsync();
            foreach (var i in menuItemRequest.Recipe.RecipeIngredients)
            {
                var RecipeIngredientMap = _menuItemMapper.CreateRecipeIngredient(i);
                RecipeIngredientMap.RecipeId = newRecipe.Id;
                _context.RecipeIngredients.Add(RecipeIngredientMap);
            }
            await _context.SaveChangesAsync();
            await transaction.CommitAsync();
            var response = _menuItemMapper.MenuItemToMenuItemResponse(newItem);
            return CreatedAtAction(nameof(GetMenuItem), new { id = newItem.ItemId }, response);
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return BadRequest("Failed to create menu item: " + ex.Message);
        }
    }

    private bool Exists(int? id)
    {
        // Kiểm tra xem supplier có tồn tại trong database hay không
        return _context.Recipes.Any(e => e.Id == id);
    }

    //Delete
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<ActionResult<MenuItemResponse>> DeleteMenuItem(int id)
    {
        var menuItem = await _context.MenuItems.FindAsync(id);
        if (menuItem == null)
        {
            return NotFound(new ProblemDetails
            {
                Detail = $"MenuItem with ID {id} not found",
                Title = "Resource Not Found",
                Status = 404,
            });
        }
        menuItem.IsActive = false;
        await _context.SaveChangesAsync();
        return await GetMenuItem(id);
    }
    [HttpGet("export-excel-closedxml")]
    public async Task<IActionResult> ExportMenuItemsToExcel_ClosedXML()
    {
        var menuItems = await _context.MenuItems.ToListAsync();
        var menuItemResponses = _menuItemMapper.MenuItemsToMenuItemResponses(menuItems);

        using (var workbook = new XLWorkbook())
        {
            var worksheet = workbook.Worksheets.Add("MenuItems");

            // Header
            worksheet.Cell(1, 1).Value = "ItemId";
            worksheet.Cell(1, 2).Value = "ItemName";
            worksheet.Cell(1, 3).Value = "Description";
            worksheet.Cell(1, 4).Value = "BasePrice";
            worksheet.Cell(1, 5).Value = "IsActive";
            worksheet.Cell(1, 6).Value = "CreatedAt";

            int row = 2;
            foreach (var item in menuItemResponses)
            {
                worksheet.Cell(row, 1).Value = item.ItemId;
                worksheet.Cell(row, 2).Value = item.ItemName;
                worksheet.Cell(row, 3).Value = item.Description ?? "";
                worksheet.Cell(row, 4).Value = item.BasePrice;
                worksheet.Cell(row, 5).Value = item.IsActive.HasValue
                ? (item.IsActive.Value ? "Active" : "Inactive")
                : "Unknown";
                worksheet.Cell(row, 6).Value = item.CreatedAt?.ToString("yyyy-MM-dd HH:mm:ss") ?? "";
                row++;
            }

            // Auto fit columns
            worksheet.Columns().AdjustToContents();

            using (var stream = new MemoryStream())
            {
                workbook.SaveAs(stream);
                stream.Position = 0;
                var fileName = $"MenuItems_{DateTime.Now:yyyyMMddHHmmss}.xlsx";
                return File(
                    stream.ToArray(),
                    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                    fileName
                );
            }
        }
    }
}