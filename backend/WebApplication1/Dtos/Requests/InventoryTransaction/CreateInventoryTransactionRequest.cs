
using WebApplication1.Dtos.Requests.InventoryTransactionDetail;
namespace WebApplication1.Dtos.Requests.InventoryTransaction
{
    public class CreateInventoryTransactionRequest
    {
        public string? TransactionType { get; set; }
        public string? CreatedBy { get; set; }
        public string? Notes { get; set; }
        public ICollection<CreateInventoryTransactionDetailRequest> InventoryTransactionDetails { get; set; } = new List<CreateInventoryTransactionDetailRequest>();
    }
}