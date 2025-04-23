using System.Security.Claims;
using Auth0.ManagementApi;

namespace WebApplication1.Middlewares;

public class UserSyncer : IMiddleware
{
    private readonly ILogger<UserSyncer> _logger;
    private readonly ManagementApiClient _auth0Api;

    public UserSyncer(ILogger<UserSyncer> logger, ManagementApiClient auth0Api)
    {
        _logger = logger;
        _auth0Api = auth0Api;
    }

    public async Task InvokeAsync(HttpContext context, RequestDelegate next)
    {
        string? userId = context.User.FindFirst(ClaimTypes.NameIdentifier)?.Value
                         ?? context.User.FindFirst("sub")?.Value;
        if (userId == null)
        {
            _logger.LogWarning("User ID not found in claims.");
            await next(context);
            return;
        }

        var user = await _auth0Api.Users.GetAsync(userId);
        if (user == null)
        {
            _logger.LogError("User with id {} not found in Auth0.", userId);
            await next(context);
            return;
        }
        _logger.LogInformation("User with id {} found in Auth0.", userId);

        var dbUser = new
        {
            Username = user.UserName,
            Email = user.Email,
            FirstName = user.FirstName,
            LastName = user.LastName,
            Picture = user.Picture,
            PhoneNumber = user.PhoneNumber,
            EmailVerified = user.EmailVerified,
            PhoneVerified = user.PhoneVerified,
            CreatedAt = user.CreatedAt,
            UpdatedAt = user.UpdatedAt,
        };

        await next(context);
    }
}