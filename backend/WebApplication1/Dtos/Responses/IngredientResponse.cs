namespace WebApplication1.Controllers;

public class IngredientResponse
{
    public int IngredientId { get; set; }

    public string IngredientName { get; set; } = null!;

    public string Unit { get; set; } = null!;

    public decimal? CurrentQuantity { get; set; }

    public decimal? CostPerUnit { get; set; }

    public DateTime? CreatedAt { get; set; }

    public SupplierResponse? Supplier { get; set; }

    public class SupplierResponse
    {
        public int SupplierId { get; set; }

        public string SupplierName { get; set; } = null!;

        public string? ContactPhone { get; set; }

        public string? Address { get; set; }

        public bool? IsActive { get; set; }

        public DateTime? CreatedAt { get; set; }
    }
}