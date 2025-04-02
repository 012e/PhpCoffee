namespace WebApplication1.Database;

public partial class InventoryTransaction
{
    public int TransactionId { get; set; }

    public int? IngredientId { get; set; }

    public string TransactionType { get; set; } = null!;

    public decimal Quantity { get; set; }

    public DateTime? TransactionDate { get; set; }

    public decimal? UnitPrice { get; set; }

    public decimal? TotalCost { get; set; }

    public virtual Ingredient? Ingredient { get; set; }
}