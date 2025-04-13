using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Database;
using WebApplication1.Dtos.Mappers;
using WebApplication1.Dtos.Requests;
using WebApplication1.Dtos.Requests.Supplier;
using WebApplication1.Helpers;
using WebApplication1.Services;

namespace WebApplication1.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class SupplierController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly SupplierMapper _supplierMapper;
        public SupplierController(ApplicationDbContext context, SupplierMapper supplierMapper)
        {
            _context = context;
            _supplierMapper = supplierMapper;
        }

        //Lấy tất cả các nhà cung cấp
        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<SupplierResponses>), StatusCodes.Status200OK)]
        public async Task<ActionResult<IEnumerable<SupplierResponses>>> GetSupplier()
        {
            var supliers = await _context.Suppliers.ToArrayAsync();
            return Ok(_supplierMapper.SuppliersToSupplierResponses(supliers));
        }

        //Lấy thông tin theo id
        [HttpGet("{id}")]
        [ProducesResponseType(typeof(SupplierResponses), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<SupplierResponses>> GetSupplierByID(int id)
        {
            var supplier = await _context.Suppliers.FindAsync(id);
            if (supplier == null)
            {
                return NotFound();
            }
            return Ok(_supplierMapper.SupplierToSupplierResponse(supplier));
        }

        //Tạo mới thông tin của nhà cung cấp
        [HttpPost]
        [ProducesResponseType(typeof(SupplierResponses), StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]

        public async Task<ActionResult<SupplierResponses>> CreateSupplier(CreateSupplierRequest supplierRequest)
        {
            var newSupplier = _supplierMapper.CreateSupplierRequestToSupplier(supplierRequest);
            _context.Add(newSupplier);
            await _context.SaveChangesAsync();
            var response = _supplierMapper.SupplierToSupplierResponse(newSupplier);
            return CreatedAtAction(nameof(GetSupplierByID), new { id = newSupplier.SupplierId }, response);
        }

        //Xóa một nhà cung cấp
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteSupplier(int id)
        {
            var del = await _context.Suppliers.FindAsync(id);
            if (del == null)
            {

                return NotFound(new ProblemDetails
                {
                    Detail = $"Supplier with ID {id} not found",
                    Title = "Resource Not Found",
                    Status = 404,
                }
                );
            }
            else
            {
                _context.Suppliers.Remove(del);
                await _context.SaveChangesAsync();
            }
            return NoContent();
        }
    }
}