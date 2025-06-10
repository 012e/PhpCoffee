using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Database;
using WebApplication1.Dtos.Mappers;
using WebApplication1.Dtos.Requests;
using WebApplication1.Dtos.Requests.Users;
using WebApplication1.Helpers;
using WebApplication1.Services;

namespace WebApplication1.Controllers
{
    [Route("[controller]/")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly UserMapper _userMapper;
        public UserController(ApplicationDbContext context, UserMapper userMapper)
        {
            _context = context;
            _userMapper= userMapper;
        }

        [HttpGet]
         [ProducesResponseType(typeof(IEnumerable<UserResponse>), StatusCodes.Status200OK)]
         public async Task<ActionResult<IEnumerable<UserResponse>>> GetAllUsers()
         {
            var users = await _context.Users.ToListAsync();
            var userResponses = _userMapper.UsersToUserResponses(users);
            return Ok(userResponses);
         }

        [HttpGet("{id}")]
        [ProducesResponseType(typeof(UserResponse), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<UserResponse>> GetUserById(int id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            var userResponse = _userMapper.UserToUserResponse(user);
            return Ok(userResponse);
        }
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            _context.Users.Remove(user);
            await _context.SaveChangesAsync();
            return NoContent();
        }
        [HttpPut("{id}")]
        [ProducesResponseType(typeof(UserResponse), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<UserResponse>> UpdateUser(int id, UpdateUserRequest request)
        {
            if (id <= 0 || request == null)
            {
                return BadRequest("Invalid user ID or request data.");
            }

            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            // Map the request to the user entity (chỉ cập nhật các trường thay đổi)
            _userMapper.UpdateUserRequestToUser(request, user);

            // Ghi nhận thời gian cập nhật
            user.UpdatedAt = DateTime.SpecifyKind(DateTime.UtcNow, DateTimeKind.Unspecified);

            try
            {
                _context.Users.Update(user);
                // Lưu thay đổi vào database
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                // Lỗi đồng thời, có thể do dữ liệu đã bị thay đổi bởi một tiến trình khác
                return NotFound();
            }
            catch (Exception ex) // Xử lý lỗi chung
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"An unexpected error occurred: {ex.Message}");
            }

            return Ok(_userMapper.UserToUserResponse(user));
        }
    }
}