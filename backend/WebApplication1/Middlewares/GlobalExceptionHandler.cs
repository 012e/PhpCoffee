namespace WebApplication1.Middlewares;
using System.ComponentModel.DataAnnotations;
using System.Net;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System.Text.Json;

internal sealed class GlobalExceptionHandler : IExceptionHandler
{
    private readonly ILogger<GlobalExceptionHandler> _logger;

    public GlobalExceptionHandler(ILogger<GlobalExceptionHandler> logger)
    {
        _logger = logger;
    }

    public async ValueTask<bool> TryHandleAsync(HttpContext httpContext, Exception exception, CancellationToken cancellationToken)
    {
        _logger.LogError(exception, "Unhandled exception occurred");

        var statusCode = exception switch
        {
            BadHttpRequestException => (int)HttpStatusCode.BadRequest,
            ValidationException => (int)HttpStatusCode.UnprocessableEntity,
            _ => (int)HttpStatusCode.InternalServerError
        };

        httpContext.Response.StatusCode = statusCode;
        httpContext.Response.ContentType = "application/json";

        var response = new ErrorResponse
        {
            Message = exception switch
            {
                BadHttpRequestException => "Invalid request payload.",
                ValidationException => "Validation failed.",
                _ => "An unexpected error occurred. Please try again later."
            },
            Details = exception.Message
        };

        var jsonResponse = JsonSerializer.Serialize(response);
        await httpContext.Response.WriteAsync(jsonResponse, cancellationToken);

        return true; // Exception handled
    }
}

internal sealed class ErrorResponse
{
    public string Message { get; set; } = string.Empty;
    public string? Details { get; set; }
}
