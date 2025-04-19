using System;
using System.Collections.Generic;

namespace WebApplication1.Database;

public partial class InventoryTransactionDetail
{
    public int TransactionId { get; set; }

    public int IngredientId { get; set; }

    public decimal? Quantity { get; set; }

    public decimal? UnitPrice { get; set; }

    public decimal? TotalCost { get; set; }

    public virtual Ingredient Ingredient { get; set; } = null!;

    public virtual InventoryTransaction Transaction { get; set; } = null!;
}
