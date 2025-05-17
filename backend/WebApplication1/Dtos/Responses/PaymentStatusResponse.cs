namespace WebApplication1.Dtos.Responses;

public class PaymentStatusResponse
{
    public string PaymentStatus { get; set; }
    public int OrderId { get; set; }
    public bool IsPaid { get; set; }
    public string Message { get; set; }
}