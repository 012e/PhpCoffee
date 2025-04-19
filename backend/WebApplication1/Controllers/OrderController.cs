using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using WebApplication1.Database;
using WebApplication1.Dtos.Mappers;
using WebApplication1.Dtos.Requests.Orders;

namespace WebApplication1.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class OrderController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly OrdersMapper _ordersMapper;

        public OrderController(ApplicationDbContext context, OrdersMapper ordersMapper)
        {
            _ordersMapper = ordersMapper;
            _context = context;
        }
        
        [HttpPost] 
        [ProducesResponseType(typeof(Order), StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<Order>> Create (CreateOrdersRequest createOrdersRequest)
        {
            using var transaction= await _context.Database.BeginTransactionAsync();
            try{
            var newOrder= _ordersMapper.CreateOrdersRequestToOrder(createOrdersRequest);
            _context.Orders.Add(newOrder);
            await _context.SaveChangesAsync();
            foreach (var item in createOrdersRequest.CreateOrderItemRequests)
            {
                var newItem = _ordersMapper.CreateOrderItemRequestInOrders(item);
                newItem.TotalPrice=newItem.UnitPrice*newItem.Quantity;
                newItem.OrderId=newOrder.OrderId;
                _context.OrderItems.Add(newItem);
                newOrder.TotalAmount+=newItem.TotalPrice;
            }
            _context.Orders.Update(newOrder);
            await _context.SaveChangesAsync();
            var newPayment= _ordersMapper.CreatePaymentRequestInOrders(createOrdersRequest.CreatePaymentRequest);
            newPayment.OrderId=newOrder.OrderId;
            _context.Payments.Add(newPayment);
            if (newPayment.PaymentMethod=="Tien mat")
            {
                newOrder.PaymentStatus="Da thanh toan";
            }
            else if(newPayment.PaymentMethod=="Chuyen khoan") 
            {
                newOrder.PaymentStatus="Doi thanh toan";
            }
            _context.Update(newOrder);
            await _context.SaveChangesAsync();
            return Ok();
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return BadRequest("Failed to create orders: " + ex.Message);
            }
        }
    }
}