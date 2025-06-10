using Riok.Mapperly.Abstractions;
using WebApplication1.Controllers;
using WebApplication1.Database;
using WebApplication1.Dtos.Requests.OrderItems;
using WebApplication1.Dtos.Requests.Orders;
using WebApplication1.Dtos.Requests.Payment;

namespace WebApplication1.Dtos.Mappers
{
    [Mapper(AllowNullPropertyAssignment = false)]
    public partial class OrdersMapper
    {
        [MapperIgnoreTarget(nameof(Order.OrderId))]
        [MapperIgnoreTarget(nameof(Order.OrderDate))]
        [MapperIgnoreTarget(nameof(Order.OrderItems))]
        [MapperIgnoreTarget(nameof(Order.Payments))]
        [MapperIgnoreTarget(nameof(Order.TotalAmount))]
        [MapperIgnoreTarget(nameof(Order.Remaining))]
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

        // New methods for mapping to response DTOs
        public partial OrderResponse OrderToOrderResponse(Order order);
        public partial OrderItemResponse OrderItemToOrderItemResponse(OrderItem orderItem);
        public partial PaymentResponse PaymentToPaymentResponse(Payment payment);
    }
}