namespace WebApplication1.Dtos.Requests;

public class UpdateIngredientRequest
{
    public string? IngredientName { get; set; }

    public string? Unit { get; set; }

    public decimal? CurrentQuantity { get; set; }

    public string? IngredientDescription { get; set; }
    public int? SupplierId { get; set; }
}