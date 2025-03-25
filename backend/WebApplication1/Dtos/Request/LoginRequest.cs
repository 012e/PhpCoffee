using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Dtos.Input;

public class LoginRequest
{
    [Required]
    [EmailAddress]
    public string Email { get; set; }

    [Required]
    [DataType(DataType.Password)]
    public string Password { get; set; }
}