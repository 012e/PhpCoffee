using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Database;

namespace WebApplication1.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class DashboardController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public DashboardController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet("stats")]
        [ProducesResponseType(typeof(DashboardStatsResponse), StatusCodes.Status200OK)]
        public async Task<ActionResult<DashboardStatsResponse>> GetDashboardStats()
        {
            // Get current date for filtering
            var today = DateTime.Today;
            var thirtyDaysAgo = today.AddDays(-30);
            var sevenDaysAgo = today.AddDays(-7);

            // Total counts
            var totalUsers = await _context.Users.CountAsync();
            var totalIngredients = await _context.Ingredients.CountAsync();
            var totalMenuItems = await _context.MenuItems
                .Where(m => m.IsActive == true)
                .CountAsync();
            var totalSuppliers = await _context.Suppliers.CountAsync();
            var totalOrders = await _context.Orders.CountAsync();

            // Revenue calculations
            var totalRevenue = await _context.Orders
                .Where(o => o.PaymentStatus == "Da thanh toan")
                .SumAsync(o => o.TotalAmount);

            var monthlyRevenue = await _context.Orders
                .Where(o => o.PaymentStatus == "Da thanh toan" && o.OrderDate >= thirtyDaysAgo)
                .SumAsync(o => o.TotalAmount);

            var weeklyRevenue = await _context.Orders
                .Where(o => o.PaymentStatus == "Da thanh toan" && o.OrderDate >= sevenDaysAgo)
                .SumAsync(o => o.TotalAmount);

            // Recent orders count
            var recentOrdersCount = await _context.Orders
                .Where(o => o.OrderDate >= sevenDaysAgo)
                .CountAsync();

            // Orders by status
            var pendingOrders = await _context.Orders
                .Where(o => o.PaymentStatus == "Doi thanh toan")
                .CountAsync();

            var completedOrders = await _context.Orders
                .Where(o => o.PaymentStatus == "Da thanh toan")
                .CountAsync();

            // Low stock ingredients (current quantity < 10)
            var lowStockIngredients = await _context.Ingredients
                .Where(i => i.CurrentQuantity < 10)
                .CountAsync();

            // Most popular menu items (by order count in last 30 days)
            var popularMenuItems = await _context.OrderItems
                .Include(oi => oi.Order)
                .Include(oi => oi.Item)
                .Where(oi => oi.Order.OrderDate >= thirtyDaysAgo && oi.Item!.IsActive == true)
                .GroupBy(oi => new { oi.ItemId, oi.Item!.ItemName })
                .Select(g => new PopularMenuItem
                {
                    ItemId = g.Key.ItemId,
                    ItemName = g.Key.ItemName,
                    OrderCount = g.Sum(oi => oi.Quantity)
                })
                .OrderByDescending(x => x.OrderCount)
                .Take(5)
                .ToListAsync();

            // Daily revenue for the last 7 days
            var dailyRevenue = await _context.Orders
                .Where(o => o.PaymentStatus == "Da thanh toan" && o.OrderDate >= sevenDaysAgo)
                .GroupBy(o => o.OrderDate!.Value.Date)
                .Select(g => new DailyRevenue
                {
                    Date = g.Key,
                    Revenue = g.Sum(o => o.TotalAmount)
                })
                .OrderBy(x => x.Date)
                .ToListAsync();

            // Recent inventory transactions
            var recentTransactions = await _context.InventoryTransactions
                .Include(it => it.InventoryTransactionDetails)
                .OrderByDescending(it => it.TransactionDate)
                .Take(5)
                .Select(it => new RecentTransaction
                {
                    TransactionId = it.TransactionId,
                    TransactionType = it.TransactionType,
                    TransactionDate = it.TransactionDate,
                    TotalAmount = it.InventoryTransactionDetails.Sum(d => d.TotalCost)
                })
                .ToListAsync();

            var response = new DashboardStatsResponse
            {
                TotalCounts = new TotalCounts
                {
                    Users = totalUsers,
                    Ingredients = totalIngredients,
                    MenuItems = totalMenuItems,
                    Suppliers = totalSuppliers,
                    Orders = totalOrders
                },
                Revenue = new RevenueStats
                {
                    Total = totalRevenue,
                    Monthly = monthlyRevenue,
                    Weekly = weeklyRevenue
                },
                Orders = new OrderStats
                {
                    Recent = recentOrdersCount,
                    Pending = pendingOrders,
                    Completed = completedOrders
                },
                Inventory = new InventoryStats
                {
                    LowStockItems = lowStockIngredients
                },
                PopularMenuItems = popularMenuItems,
                DailyRevenue = dailyRevenue,
                RecentTransactions = recentTransactions
            };

            return Ok(response);
        }
    }

    public class DashboardStatsResponse
    {
        public TotalCounts TotalCounts { get; set; } = new();
        public RevenueStats Revenue { get; set; } = new();
        public OrderStats Orders { get; set; } = new();
        public InventoryStats Inventory { get; set; } = new();
        public List<PopularMenuItem> PopularMenuItems { get; set; } = new();
        public List<DailyRevenue> DailyRevenue { get; set; } = new();
        public List<RecentTransaction> RecentTransactions { get; set; } = new();
    }

    public class TotalCounts
    {
        public int Users { get; set; }
        public int Ingredients { get; set; }
        public int MenuItems { get; set; }
        public int Suppliers { get; set; }
        public int Orders { get; set; }
    }

    public class RevenueStats
    {
        public decimal Total { get; set; }
        public decimal Monthly { get; set; }
        public decimal Weekly { get; set; }
    }

    public class OrderStats
    {
        public int Recent { get; set; }
        public int Pending { get; set; }
        public int Completed { get; set; }
    }

    public class InventoryStats
    {
        public int LowStockItems { get; set; }
    }

    public class PopularMenuItem
    {
        public int ItemId { get; set; }
        public string ItemName { get; set; } = string.Empty;
        public int OrderCount { get; set; }
    }

    public class DailyRevenue
    {
        public DateTime Date { get; set; }
        public decimal Revenue { get; set; }
    }

    public class RecentTransaction
    {
        public int TransactionId { get; set; }
        public string? TransactionType { get; set; }
        public DateTime? TransactionDate { get; set; }
        public decimal? TotalAmount { get; set; }
    }
}
