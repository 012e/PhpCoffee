using Riok.Mapperly.Abstractions;
using Supabase;
using WebApplication1.Controllers;
using WebApplication1.Database;
using WebApplication1.Dtos.Requests;
using WebApplication1.Dtos.Requests.MenuItem;
using WebApplication1.Dtos.Requests.Recipe;
using WebApplication1.Dtos.Requests.RecipeIngredient;

namespace WebApplication1.Dtos.Mappers
{
    [Mapper(AllowNullPropertyAssignment = false)]
    public partial class MenuItemMapper
    {

        public partial MenuItemResponse MenuItemToMenuItemResponse(MenuItem menuItem);
        public partial IEnumerable<MenuItemResponse> MenuItemsToMenuItemResponses(IEnumerable<MenuItem> menuItems);

        [MapperIgnoreTarget(nameof(MenuItem.ItemId))]
        [MapperIgnoreTarget(nameof(MenuItem.CreatedAt))]
        [MapperIgnoreTarget(nameof(MenuItem.OrderItems))]
        [MapperIgnoreTarget(nameof(MenuItem.Recipe))]
        [MapperIgnoreTarget(nameof(MenuItem.RecipeId))]
        public partial MenuItem CreateMenuItemRequestToMenuItem(CreateMenuItemRequest menuItemRequest);
        [MapperIgnoreTarget(nameof(Recipe.Id))]
        [MapperIgnoreTarget(nameof(Recipe.MenuItems))]
        [MapperIgnoreTarget(nameof(Recipe.RecipeIngredients))]
        [MapperIgnoreTarget(nameof(Recipe.CreatedAt))]
        public partial Recipe CreteRecipeInMenu(CreateRecipeRequest createRecipeRequest);
        [MapperIgnoreTarget(nameof(RecipeIngredient.RecipeId))]
        [MapperIgnoreTarget(nameof(RecipeIngredient.Ingredient))]
        [MapperIgnoreTarget(nameof(RecipeIngredient.Recipe))]
        public partial RecipeIngredient CreateRecipeIngredient(CreateRecipeIngredientRequest createRecipeIngredientRequest);

    }
}