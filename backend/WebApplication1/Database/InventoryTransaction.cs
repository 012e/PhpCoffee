using System;
using System.Collections.Generic;

namespace WebApplication1.Database;

public partial class InventoryTransaction
{
    public int TransactionId { get; set; }

    public string? TransactionType { get; set; }

    public DateTime? TransactionDate { get; set; }

    public string? CreatedBy { get; set; }

    public string? Notes { get; set; }

    public virtual ICollection<InventoryTransactionDetail> InventoryTransactionDetails { get; set; } = new List<InventoryTransactionDetail>();
}
