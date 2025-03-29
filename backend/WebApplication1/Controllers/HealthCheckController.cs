using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace WebApplication1.Controllers;

[ApiController]
[Route("[controller]")]
public class HealthCheckController : ControllerBase
{
    private readonly ILogger<HealthCheckController> _logger;

    public HealthCheckController(ILogger<HealthCheckController> logger)
    {
        _logger = logger;
    }

    [HttpGet("ThrowException")]
    public string Throw()
    {
        throw new Exception("what the fuck");
        //return "hello world";
    }

    [Authorize]
    [HttpGet("CurrentUser")]
    [ProducesResponseType(typeof(ProblemDetails), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(IEnumerable<Claim>), StatusCodes.Status400BadRequest)]
    public IActionResult Hello()
    {
        if (User.Identity is null || !User.Identity.IsAuthenticated)
        {
            return BadRequest(new ProblemDetails
            {
                Title = "User is not logged in"
            });
        }

        return Ok(User.Claims);
    }


    [Authorize]
    [HttpGet("Authorized")]
    public string Authorized()
    {
        return "hello world";
    }
}