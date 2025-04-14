namespace WebApplication1.Dtos.Requests.InventoryTransactionDetail
{
    public class CreateInventoryTransactionDetailRequest
    {
        public int IngredientId { get; set; }
        public decimal? Quantity { get; set; }
        public decimal? UnitPrice { get; set; }
        public decimal? TotalCost { get; set; }

    }
}