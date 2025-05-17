namespace WebApplication1.Controllers;

public class OrderResponse
{
    public int OrderId { get; set; }

    public DateTime? OrderDate { get; set; }

    public decimal TotalAmount { get; set; }

    public string? PaymentStatus { get; set; }

    public decimal Remaining { get; set; }

    public ICollection<OrderItemResponse> OrderItems { get; set; } = new List<OrderItemResponse>();

    public ICollection<PaymentResponse> Payments { get; set; } = new List<PaymentResponse>();
}

public class OrderItemResponse
{
    public int ItemId { get; set; }

    public int Quantity { get; set; }

    public decimal UnitPrice { get; set; }

    public decimal TotalPrice { get; set; }

    public MenuItemResponse? MenuItem { get; set; }
}

public class PaymentResponse
{
    public int PaymentId { get; set; }

    public decimal Amount { get; set; }

    public string PaymentMethod { get; set; } = null!;

    public DateTime? PaymentDate { get; set; }
}