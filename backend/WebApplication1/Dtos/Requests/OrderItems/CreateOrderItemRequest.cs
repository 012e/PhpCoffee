namespace WebApplication1.Dtos.Requests.OrderItems
{
    public class CreateOrderItemRequest
    {
        public int ItemId { get; set; }

        public int Quantity { get; set; }

        public decimal UnitPrice { get; set; }

    }
}