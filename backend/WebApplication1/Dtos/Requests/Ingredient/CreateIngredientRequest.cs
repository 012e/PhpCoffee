namespace WebApplication1.Dtos.Requests;

public class CreateIngredientRequest
{
    public string IngredientName { get; set; } = null!;

    public string Unit { get; set; } = null!;

    public decimal? CurrentQuantity { get; set; }

    public decimal? CostPerUnit { get; set; }

    public string Name { get; set; } = null!;

    public decimal Quantity { get; set; }

    public int? SupplierId { get; set; }
}