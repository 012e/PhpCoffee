using Riok.Mapperly.Abstractions;
using WebApplication1.Database;
using WebApplication1.Dtos.Requests.InventoryTransaction;
using WebApplication1.Dtos.Requests.InventoryTransactionDetail;

namespace WebApplication1.Dtos.Mappers
{
    [Mapper(AllowNullPropertyAssignment = false)]
    public partial class InventoryTransactionMapper
    {
        [MapperIgnoreTarget(nameof(InventoryTransaction.TransactionId))]
        [MapperIgnoreTarget(nameof(InventoryTransaction.TransactionDate))]
        [MapperIgnoreTarget(nameof(InventoryTransaction.InventoryTransactionDetails))]
        public partial InventoryTransaction CreateInventoryTransactionToInventoryTransaction(CreateInventoryTransactionRequest transactionRequest);
        // Mapping cho chi tiết giao dịch
        [MapperIgnoreTarget(nameof(InventoryTransactionDetail.Ingredient))]
        [MapperIgnoreTarget(nameof(InventoryTransactionDetail.Transaction))]
        [MapperIgnoreTarget(nameof(InventoryTransactionDetail.TransactionId))]
        public partial InventoryTransactionDetail CreateInventoryTransactionDetailToInventoryTransactionDetail(
            CreateInventoryTransactionDetailRequest detailRequest);
        public partial List<InventoryTransactionDetail> MapDetails(List<CreateInventoryTransactionDetailRequest> detailRequests);
    }
}