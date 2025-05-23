﻿using System;
using System.Collections.Generic;

namespace WebApplication1.Database;

public partial class Payment
{
    public int OrderId { get; set; }

    public decimal Amount { get; set; }

    public string PaymentMethod { get; set; } = null!;

    public DateTime? PaymentDate { get; set; }

    public int PaymentId { get; set; }

    public virtual Order Order { get; set; } = null!;
}
