using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Database;

namespace WebApplication1.Controllers;

[Route("[controller]")]
[ApiController]
public class InventoryTransactionController : ControllerBase
{
    private readonly PostgresContext _context;

    public InventoryTransactionController(PostgresContext context)
    {
        _context = context;
    }

    //[GET] lấy tất cả các hóa đơn
    [HttpGet]
    public async Task<ActionResult<IEnumerable<InventoryTransaction>>> GetTransactions()
    {
        return await _context.InventoryTransactions.ToListAsync();
    }

    //lấy theo số id
    [HttpGet("{id}")]
    public async Task<ActionResult<InventoryTransaction>> GetTransactionsById(int id)
    {
        var transaction = await _context.InventoryTransactions.FindAsync(id);

        if (transaction == null)
        {
            return NotFound(new { message = "Không tìm thấy giao dịch" });
        }

        return transaction;
    }

    //Them giao dich moi
    [HttpPost]
    public async Task<ActionResult<InventoryTransaction>> AddTransaction(InventoryTransaction NewTransaction)
    {
        if (NewTransaction.UnitPrice.HasValue)
        {
            NewTransaction.TotalCost = NewTransaction.Quantity * NewTransaction.UnitPrice;
        }

        _context.InventoryTransactions.Add(NewTransaction);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetTransactionsById), new { id = NewTransaction.TransactionId }, NewTransaction);
    }

    //Cap nhat giao dich
    [HttpPut("{id}")]
    public async Task<ActionResult> UpdateTransaction(int id, InventoryTransaction transaction_Update)
    {
        var findid = await _context.InventoryTransactions.FindAsync(id);
        if (findid == null)
        {
            return NotFound(new { message = "Không tìm thấy giao dịch" });
        }

        findid.TransactionId = transaction_Update.TransactionId;
        findid.IngredientId = transaction_Update.IngredientId;
        findid.TransactionType = transaction_Update.TransactionType;
        findid.Quantity = transaction_Update.Quantity;
        findid.TransactionDate = transaction_Update.TransactionDate;
        findid.UnitPrice = transaction_Update.UnitPrice;
        findid.TotalCost = transaction_Update.UnitPrice.HasValue
            ? transaction_Update.UnitPrice * transaction_Update.Quantity
            : null;
        await _context.SaveChangesAsync();
        return Ok(new { message = "hoan thanh cap nhat" });
    }

    //Xoa
    [HttpDelete("{id}")]
    public async Task<ActionResult> DeleteTransactionById(int id)
    {
        var delete = await _context.InventoryTransactions.FindAsync(id);
        if (delete == null)
        {
            return NotFound(new { message = "Khong tim thay id" });
        }

        _context.InventoryTransactions.Remove(delete);
        await _context.SaveChangesAsync();
        return Ok(new { message = "Xoa thanh cong" });
    }
}