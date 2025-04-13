namespace WebApplication1.Controllers;
public class MenuItemResponse
{
    public int ItemId { get; set; }
    public string ItemName { get; set; } = null!;
    public string? Description { get; set; }
    public decimal BasePrice { get; set; }
    public bool? IsActive { get; set; }
    public DateTime? CreatedAt { get; set; }
}