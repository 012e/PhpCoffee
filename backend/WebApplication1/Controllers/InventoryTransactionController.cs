using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Transactions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
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

        public InventoryTransactionController(ApplicationDbContext context, InventoryTransactionMapper inventoryTransactionMapper)
        {
            _context = context;
            _inventoryTransactionMapper = inventoryTransactionMapper;
        }
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<InventoryTransaction>> CreateInventoryTransaction(CreateInventoryTransactionRequest inventoryTransactionRequest)
        {
            var newitem = _inventoryTransactionMapper.CreateInventoryTransactionToInventoryTransaction(inventoryTransactionRequest);
            _context.InventoryTransactions.Add(newitem);
            await _context.SaveChangesAsync();
            if (inventoryTransactionRequest.InventoryTransactionDetails != null && inventoryTransactionRequest.InventoryTransactionDetails.Any())
            {
                foreach (var detailRequest in inventoryTransactionRequest.InventoryTransactionDetails)
                {
                    var detail = _inventoryTransactionMapper.CreateInventoryTransactionDetailToInventoryTransactionDetail(detailRequest);
                    detail.TransactionId = newitem.TransactionId;
                    _context.InventoryTransactionDetails.Add(detail);

                }
                await _context.SaveChangesAsync();
            }
            var result = await _context.InventoryTransactions
            .Include(t => t.InventoryTransactionDetails)
            .FirstOrDefaultAsync(t => t.TransactionId == newitem.TransactionId);

            return CreatedAtAction(nameof(GetTransaction), new { id = newitem.TransactionId }, result);
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<InventoryTransaction>> GetTransaction(int id)
        {
            var transaction = await _context.InventoryTransactions
                .Include(t => t.InventoryTransactionDetails)
                .FirstOrDefaultAsync(t => t.TransactionId == id);

            if (transaction == null)
            {
                return NotFound();
            }

            return transaction;
        }
    }
}