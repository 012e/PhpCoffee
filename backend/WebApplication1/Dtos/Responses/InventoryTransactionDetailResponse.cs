namespace WebApplication1.Controllers
{
    public class InventoryTransactionDetailResponse
    {
        public int TransactionId { get; set; }

        public int IngredientId { get; set; }

        public decimal? Quantity { get; set; }

        public decimal? UnitPrice { get; set; }

        public decimal? TotalCost { get; set; }

    }
}