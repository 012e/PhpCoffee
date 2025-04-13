namespace WebApplication1.Controllers;

public class IngredientResponse
{
    public int IngredientId { get; set; }

    public string IngredientName { get; set; } = null!;

    public string Unit { get; set; } = null!;

    public decimal? CurrentQuantity { get; set; }

    public decimal? CostPerUnit { get; set; }
    public string? ImageUrl { get; set; }

    public DateTime? CreatedAt { get; set; }

    public SupplierResponses? Supplier { get; set; }

}