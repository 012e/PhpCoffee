using System.Text.Json.Serialization;
namespace WebApplication1.Dtos.Requests.Sepay
{
    public class SepayRequest
    {
        
       [JsonPropertyName("amount")]
        public decimal? Amount { get; set; }

        [JsonPropertyName("order_code")]
        public string OrderCode { get; set; } = default!;

        [JsonPropertyName("duration")]
        public int? Duration { get; set; }

        [JsonPropertyName("with_qrcode")]
        public bool WithQrcode { get; set; } = true;
    }
}