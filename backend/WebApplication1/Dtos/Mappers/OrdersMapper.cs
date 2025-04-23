using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authorization.Infrastructure;
using Riok.Mapperly.Abstractions;
using Supabase;
using WebApplication1.Controllers;
using WebApplication1.Database;
using WebApplication1.Dtos.Requests.OrderItems;
using WebApplication1.Dtos.Requests.Orders;
using WebApplication1.Dtos.Requests.Payment;

namespace WebApplication1.Dtos.Mappers
{
    [Mapper(AllowNullPropertyAssignment=false)]
    public partial class OrdersMapper
    {
        [MapperIgnoreTarget(nameof(Order.OrderId))]
        [MapperIgnoreTarget(nameof(Order.OrderDate))]
        [MapperIgnoreTarget(nameof(Order.OrderItems))]
        [MapperIgnoreTarget(nameof(Order.Payments))]
        [MapperIgnoreTarget(nameof(Order.TotalAmount))]
        [MapperIgnoreTarget(nameof (Order.Remaining))]
        public partial Order CreateOrdersRequestToOrder(CreateOrdersRequest createOrdersRequest);

        [MapperIgnoreTarget(nameof(OrderItem.OrderId))]
        [MapperIgnoreTarget(nameof(OrderItem.TotalPrice))]
        [MapperIgnoreTarget(nameof(OrderItem.Item))]
        [MapperIgnoreTarget(nameof(OrderItem.Order))]
        public partial OrderItem CreateOrderItemRequestInOrders(CreateOrderItemRequest createOrderItemRequest);

        [MapperIgnoreTarget(nameof(Payment.OrderId))]
        [MapperIgnoreTarget(nameof(Payment.Amount))]
        [MapperIgnoreTarget(nameof(Payment.PaymentDate))]
        [MapperIgnoreTarget(nameof(Payment.Order))]
        [MapperIgnoreTarget(nameof(Payment.PaymentId))]
        public partial Payment CreatePaymentRequestInOrders(CreatePaymentRequest createPaymentRequest);

    }
}