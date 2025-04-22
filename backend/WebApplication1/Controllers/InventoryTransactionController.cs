using System.Collections.ObjectModel;
using System.Numerics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.ObjectPool;
using WebApplication1.Database;
using WebApplication1.Dtos.Mappers;
using WebApplication1.Dtos.Requests.InventoryTransaction;

namespace WebApplication1.Controllers
{
    [Route("[controller]")]
    public class InventoryTransactionController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly InventoryTransactionMapper _inventoryTransactionMapper;

        public InventoryTransactionController(ApplicationDbContext context,
            InventoryTransactionMapper inventoryTransactionMapper)
        {
            _context = context;
            _inventoryTransactionMapper = inventoryTransactionMapper;
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<InventoryTransaction>> CreateInventoryTransaction(
            [FromBody] CreateInventoryTransactionRequest inventoryTransactionRequest)
        {
            var newitem =
                _inventoryTransactionMapper.CreateInventoryTransactionToInventoryTransaction(
                    inventoryTransactionRequest);
            _context.InventoryTransactions.Add(newitem);
            await _context.SaveChangesAsync();
            if (inventoryTransactionRequest.InventoryTransactionDetails.Count != 0)
            {
                foreach (var detailRequest in inventoryTransactionRequest.InventoryTransactionDetails)
                {
                    var detail =
                        _inventoryTransactionMapper.CreateInventoryTransactionDetailToInventoryTransactionDetail(
                            detailRequest);
                    detail.TransactionId = newitem.TransactionId;
                    detail.TotalCost = detail.Quantity * detail.UnitPrice;
                    _context.InventoryTransactionDetails.Add(detail);
                }

                await _context.SaveChangesAsync();
            }

            var result = await _context.InventoryTransactions
                .Include(t => t.InventoryTransactionDetails)
                .FirstOrDefaultAsync(t => t.TransactionId == newitem.TransactionId);

            return CreatedAtAction(nameof(GetTransactionById), new { id = newitem.TransactionId }, result);
        }

        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<InventoryTransactionResponse>),
        StatusCodes.Status200OK)]
        public async Task<ActionResult<IEnumerable<InventoryTransactionResponse>>> GetTransaction()
        {
            var transaction = await _context.InventoryTransactions.Include(x => x.InventoryTransactionDetails).ToListAsync();
            var transactionmap = transaction
    .Select(t => _inventoryTransactionMapper.InventoryTransactionToInventoryTransactionResponse(t))
    .ToList();

            // Duyệt từng transaction kèm index
            foreach (var item in transaction.Select((t, index) => new { t, index }))
            {
                // Map từng detail của transaction đó
                var mappedDetails = item.t.InventoryTransactionDetails
                    .Select(d => _inventoryTransactionMapper.InventoryTransactionDetailToInventoryTransactionDetailResponse(d))
                    .ToList();

                // Gán vào transactionmap tương ứng
                transactionmap[item.index].inventoryTransactionDetailResponses = mappedDetails;
            }
            return Ok(transactionmap);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(typeof(InventoryTransactionResponse), StatusCodes.Status200OK)]
        public async Task<ActionResult<InventoryTransactionResponse>> GetTransactionById(int id)
        {
            var transaction = await _context.InventoryTransactions.Include(x => x.InventoryTransactionDetails)
            .FirstOrDefaultAsync(x => x.TransactionId == id); ;
            if (transaction == null)
            {
                return NotFound();
            }
            else
            {
                var tranmap = _inventoryTransactionMapper.InventoryTransactionToInventoryTransactionResponse(transaction);
                foreach (var tran in transaction.InventoryTransactionDetails)
                {
                    var detailmap = _inventoryTransactionMapper.InventoryTransactionDetailToInventoryTransactionDetailResponse(tran);
                    tranmap.inventoryTransactionDetailResponses.Add(detailmap);
                }
                return Ok(tranmap);
            }
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult> DeleteInventoryTransaction(int id)
        {
            var tran = await _context.InventoryTransactions.FindAsync(id);
            if (tran == null)
            {
                return NotFound(new ProblemDetails
                {
                    Detail = $"Ingredient with ID {id} not found",
                    Title = "Resource Not Found",
                    Status = 404,
                    Type = "https://tools.ietf.org/html/rfc7231#section-6.5.4"
                });
            }
            _context.Remove(tran);
            await _context.SaveChangesAsync();
            return NoContent();
        }

    }
}