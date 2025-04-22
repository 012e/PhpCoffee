using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Database;
using WebApplication1.Dtos.Mappers;
using WebApplication1.Dtos.Requests.MenuItem;
using WebApplication1.Helpers;

namespace WebApplication1.Controllers;

[Route("[controller]")]
[ApiController]
public class MenuItemController : ControllerBase
{
    private readonly ApplicationDbContext _context;
    private readonly MenuItemMapper _menuItemMapper;
    public MenuItemController(ApplicationDbContext context, MenuItemMapper menuItemMapper)
    {
        _context = context;
        _menuItemMapper = menuItemMapper;
    }
    //Lấy tất cả
    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<MenuItemResponse>),
        StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<MenuItemResponse>>> GetMenuItems()
    {
        var menuItems = await _context.MenuItems.ToListAsync();
        return Ok(_menuItemMapper.MenuItemsToMenuItemResponses(menuItems));
    }
    //Lấy phần tử theo id 
    [HttpGet("{id}")]
    [ProducesResponseType(typeof(MenuItemResponse),
        StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<ActionResult<MenuItemResponse>> GetMenuItem(int id)
    {
        var menuItem = await _context.MenuItems.FindAsync(id);
        if (menuItem == null)
        {
            return NotFound();
        }
        return Ok(_menuItemMapper.MenuItemToMenuItemResponse(menuItem));
    }
    //Thêm mới 1 item
    [HttpPost]
    [ProducesResponseType(typeof(MenuItemResponse),
        StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<MenuItem>> CreateMenuItem(CreateMenuItemRequest menuItemRequest)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var newRecipe = _menuItemMapper.CreateRecipeInMenu(menuItemRequest.Recipe);
            _context.Recipes.Add(newRecipe);
            await _context.SaveChangesAsync();
            var newItem = _menuItemMapper.CreateMenuItemRequestToMenuItem(menuItemRequest);
            newItem.RecipeId = newRecipe.Id;
            _context.MenuItems.Add(newItem);
            await _context.SaveChangesAsync();
            foreach (var i in menuItemRequest.Recipe.RecipeIngredients)
            {
                var RecipeIngredientMap = _menuItemMapper.CreateRecipeIngredient(i);
                RecipeIngredientMap.RecipeId = newRecipe.Id;
                _context.RecipeIngredients.Add(RecipeIngredientMap);
            }
            await _context.SaveChangesAsync();
            var response = _menuItemMapper.MenuItemToMenuItemResponse(newItem);
            return CreatedAtAction(nameof(GetMenuItem), new { id = newItem.ItemId }, response);
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return BadRequest("Failed to create menu item: " + ex.Message);
        }
    }
    private bool Exists(int? id)
    {
        // Kiểm tra xem supplier có tồn tại trong database hay không
        return _context.Recipes.Any(e => e.Id == id);
    }

    //Delete
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<IActionResult> DeleteMenuItem(int id)
    {
        var menuItem = await _context.MenuItems.FindAsync(id);
        if (menuItem == null)
        {
            return NotFound(new ProblemDetails
            {
                Detail = $"MenuItem with ID {id} not found",
                Title = "Resource Not Found",
                Status = 404,
            });
        }
        _context.MenuItems.Remove(menuItem);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}