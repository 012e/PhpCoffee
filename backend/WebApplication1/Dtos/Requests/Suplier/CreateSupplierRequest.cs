namespace WebApplication1.Dtos.Requests.Supplier
{
    public class CreateSupplierRequest
    {
        public string SupplierName { get; set; } = null!;

        public string? ContactPhone { get; set; }

        public string? Address { get; set; }

        public bool? IsActive { get; set; }
    }
}