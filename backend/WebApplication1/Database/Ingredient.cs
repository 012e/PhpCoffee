using System;
using System.Collections.Generic;

namespace WebApplication1.Database;

public partial class Ingredient
{
    public int IngredientId { get; set; }

    public string IngredientName { get; set; } = null!;

    public string Unit { get; set; } = null!;

    public decimal? CurrentQuantity { get; set; }

    public decimal? CostPerUnit { get; set; }

    public int? SupplierId { get; set; }

    public DateTime? CreatedAt { get; set; }

    public string? ImageUrl { get; set; }

    public virtual ICollection<InventoryTransactionDetail> InventoryTransactionDetails { get; set; } = new List<InventoryTransactionDetail>();

    public virtual ICollection<RecipeIngredient> RecipeIngredients { get; set; } = new List<RecipeIngredient>();

    public virtual Supplier? Supplier { get; set; }
}
