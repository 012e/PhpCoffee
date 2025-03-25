namespace WebApplication1.Dtos.Response;

public class AuthenticationTokenResponse
{
    public required string Token { get; set; }
    public required DateTime Expiration { get; set; }
}