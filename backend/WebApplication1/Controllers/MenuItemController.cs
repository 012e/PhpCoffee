using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Database;

namespace WebApplication1.Controllers;
[Route("api/[controller]")]
[ApiController]
public class MenuItemController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public MenuItemController(ApplicationDbContext context)
    {
        _context = context;
    }

    //[GET] lấy tất cả menu items
    [HttpGet]
    public async Task<ActionResult<IEnumerable<MenuItem>>> GetMenuItems()
    {
        return await _context.MenuItems.ToListAsync();
    }

    //lấy theo số id
    [HttpGet("{id}")]
    public async Task<ActionResult<MenuItem>> GetMenuItemById(int id)
    {
        var menuItem = await _context.MenuItems.FindAsync(id);

        if (menuItem == null)
        {
            return NotFound(new { message = "Không tìm thấy menu item" });
        }
        return menuItem;
    }

    //Thêm menu item mới
    [HttpPost]
    public async Task<ActionResult<MenuItem>> AddMenuItem(MenuItem newMenuItem)
    {
        _context.MenuItems.Add(newMenuItem);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetMenuItemById), new { id = newMenuItem.ItemId }, newMenuItem);
    }

    //Cập nhật menu item
    [HttpPut("{id}")]
    public async Task<ActionResult> UpdateMenuItem(int id, MenuItem menuItem_Update)
    {
        var findId = await _context.MenuItems.FindAsync(id);
        if (findId == null)
        {
            return NotFound(new { message = "Không tìm thấy menu item" });
        }

        findId.ItemName = menuItem_Update.ItemName;
        findId.Description = menuItem_Update.Description;
        findId.BasePrice = menuItem_Update.BasePrice;
        findId.IsActive = menuItem_Update.IsActive;
        findId.CreatedAt = menuItem_Update.CreatedAt;

        await _context.SaveChangesAsync();
        return Ok(new { message = "Hoàn thành cập nhật" });
    }

    //Xóa menu item
    [HttpDelete("{id}")]
    public async Task<ActionResult> DeleteMenuItem(int id)
    {
        var delete = await _context.MenuItems.FindAsync(id);
        if (delete == null)
        {
            return NotFound(new { message = "Không tìm thấy id" });
        }
        _context.MenuItems.Remove(delete);
        await _context.SaveChangesAsync();
        return Ok(new { message = "Xóa thành công" });
    }
}