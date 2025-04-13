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
        private readonly Client _supabaseClient;
        public SupplierMapper(Client supabaseClient)
        {
            _supabaseClient = supabaseClient;
        }
        public partial SupplierResponses SupplierToSupplierResponse(Supplier supplier);
        public partial IEnumerable<SupplierResponses> SuppliersToSupplierResponses(IEnumerable<Supplier> suppliers);

        [MapperIgnoreTarget(nameof(Supplier.SupplierId))]
        [MapperIgnoreTarget(nameof(Supplier.CreatedAt))]
        [MapperIgnoreTarget(nameof(Supplier.Ingredients))]
        public partial Supplier CreateSupplierRequestToSupplier(CreateSupplierRequest supplierRequest);
    }
}