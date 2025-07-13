using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.Database;
using WebApplication1.Controllers;
using System.Threading.RateLimiting;
using Microsoft.EntityFrameworkCore;

namespace WebApplication1.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public partial class SepayController : Controller
    {
        private readonly ApplicationDbContext _context;

        public SepayController(ApplicationDbContext context)
        {
            _context = context;
        }
        [HttpPost]
        public async Task<IActionResult> Webhook([FromBody] SepayResponse sepayResponse)
        {
            string[] content = sepayResponse.Content.Split(';');
            int orderId = int.Parse(content[^1]); // This is the Order ID, not Payment ID
            var order = await _context.Orders
                .Include(x => x.Payments)
                .FirstOrDefaultAsync(x => x.OrderId == orderId);
            
            if (order == null)
            {
                return StatusCode(200, new { success = true, message = "Order not found" });
            }
            else
            {
                order.Remaining -= sepayResponse.TransferAmount;
                if (order.Remaining <= 0)
                {
                    order.PaymentStatus = "Da thanh toan";
                    order.Remaining = 0; // Ensure it doesn't go negative
                    _context.Update(order);
                }
                else
                {
                    _context.Update(order);
                    await _context.SaveChangesAsync();
                    var newPayment = new Payment();
                    newPayment.Amount = order.Remaining;
                    newPayment.OrderId = order.OrderId;
                    newPayment.PaymentMethod = "Chuyen khoan";
                    _context.Add(newPayment);
                }

                await _context.SaveChangesAsync();
                
                // Log for debugging
                Console.WriteLine($"Webhook processed: Order {orderId}, Status: {order.PaymentStatus}, Remaining: {order.Remaining}");
            }
            return StatusCode(200, new { success = true }); // Changed to 200 as per webhook standards
        }
    }
}