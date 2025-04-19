
namespace WebApplication1.Controllers
{
    public class SupplierResponse
    {
        public int SupplierId { get; set; }

        public string SupplierName { get; set; } = null!;

        public string? ContactPhone { get; set; }

        public string? Address { get; set; }

        public bool? IsActive { get; set; }

        public DateTime? CreatedAt { get; set; }
    }
}