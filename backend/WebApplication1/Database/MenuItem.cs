using System;
using System.Collections.Generic;

namespace WebApplication1.Database;

public partial class MenuItem
{
    public int ItemId { get; set; }

    public string ItemName { get; set; } = null!;

    public string? Description { get; set; }

    public decimal BasePrice { get; set; }

    public bool? IsActive { get; set; }

    public DateTime? CreatedAt { get; set; }

    public int RecipeId { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual Recipe Recipe { get; set; } = null!;
}
