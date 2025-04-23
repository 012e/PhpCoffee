
namespace WebApplication1.Controllers
{
   public class SepayResponse
   {
      public int Id { get; set; }

      public string Gateway { get; set; } = default!;

      public DateTime TransactionDate { get; set; }

      public string AccountNumber { get; set; } = default!;

      public string? Code { get; set; } // 👈 Có thể null

      public string Content { get; set; } = default!;

      public string TransferType { get; set; } = default!;

      public decimal TransferAmount { get; set; }

      public decimal Accumulated { get; set; }

      public string? SubAccount { get; set; } // 👈 Có thể null

      public string ReferenceCode { get; set; } = default!;

      public string? Description { get; set; } // 👈 Có thể null     // Toàn bộ nội dung tin nhắn sms
   }
}