using Riok.Mapperly.Abstractions;
using Supabase;
using WebApplication1.Controllers;
using WebApplication1.Database;
using WebApplication1.Dtos.Requests;
using WebApplication1.Dtos.Requests.Supplier;

namespace WebApplication1.Dtos.Mappers
{
    [Mapper(AllowNullPropertyAssignment = false)]
    public partial class SupplierMapper
    {
        public partial SupplierResponse SupplierToSupplierResponse(Supplier supplier);
        public partial IEnumerable<SupplierResponse> SuppliersToSupplierResponses(IEnumerable<Supplier> suppliers);

        [MapperIgnoreTarget(nameof(Supplier.SupplierId))]
        [MapperIgnoreTarget(nameof(Supplier.CreatedAt))]
        [MapperIgnoreTarget(nameof(Supplier.Ingredients))]
        public partial Supplier CreateSupplierRequestToSupplier(CreateSupplierRequest supplierRequest);
    }
}