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
            string[] content = sepayResponse.Content.Split(' ');
            int paymentId = int.Parse(content[^1]);
            var payment = await _context.Payments.Include(x => x.Order).FirstOrDefaultAsync(x => x.PaymentId == paymentId);
            if (payment == null)
            {
                return StatusCode(200, new { success = true, message = "Order not found" });
            }
            else
            {
                payment.Order.Remaining -= sepayResponse.TransferAmount;
                if (payment.Order.Remaining == 0)
                {
                    payment.Order.PaymentStatus = "Da thanh toan";
                    _context.Update(payment.Order);
                }
                else
                {
                    _context.Update(payment.Order);
                    await _context.SaveChangesAsync();
                    var newPayment = new Payment();
                    newPayment.Amount = payment.Order.Remaining;
                    newPayment.OrderId = payment.Order.OrderId;
                    newPayment.PaymentMethod = "Chuyen khoan";
                    _context.Add(newPayment);
                }

                await _context.SaveChangesAsync();
            }
            return StatusCode(201, new { success = true }); ;
        }
    }
}