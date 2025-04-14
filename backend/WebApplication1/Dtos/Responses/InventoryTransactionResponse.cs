
namespace WebApplication1.Controllers
{
    public class InventoryTransactionResponse
    {
        public int TransactionId { get; set; }

        public string? TransactionType { get; set; }

        public DateTime? TransactionDate { get; set; }

        public string? CreatedBy { get; set; }

        public string? Notes { get; set; }

        public ICollection<InventoryTransactionDetailResponse> inventoryTransactionDetailResponses { get; set; } = new List<InventoryTransactionDetailResponse>();

    }
}