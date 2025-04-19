using WebApplication1.Dtos.Requests.OrderItems;
using WebApplication1.Dtos.Requests.Payment;

namespace WebApplication1.Dtos.Requests.Orders
{
    public class CreateOrdersRequest
    {
        public string? PaymentStatus { get; set; }

        public ICollection<CreateOrderItemRequest> CreateOrderItemRequests { get; set; } = new List<CreateOrderItemRequest>();
        public CreatePaymentRequest CreatePaymentRequest { get; set; } = new CreatePaymentRequest();
    }
}