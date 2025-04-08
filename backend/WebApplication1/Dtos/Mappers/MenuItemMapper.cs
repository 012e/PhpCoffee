using Riok.Mapperly.Abstractions;
using Supabase;
using WebApplication1.Controllers;
using WebApplication1.Database;
using WebApplication1.Dtos.Requests;
using WebApplication1.Dtos.Requests.MenuItem;

namespace WebApplication1.Dtos.Mappers
{
    [Mapper(AllowNullPropertyAssignment = false)]
    public partial class MenuItemMapper
    {
        private readonly Client _supabaseClient;
        public MenuItemMapper(Client supabaseClient)
        {
            _supabaseClient = supabaseClient;
        }
        public partial MenuItemResponse MenuItemToMenuItemResponse(MenuItem menuItem);
        public partial IEnumerable<MenuItemResponse> MenuItemsToMenuItemResponses(IEnumerable<MenuItem> menuItems);

        [MapperIgnoreTarget(nameof(MenuItem.ItemId))]
        [MapperIgnoreTarget(nameof(MenuItem.CreatedAt))]
        [MapperIgnoreTarget(nameof(MenuItem.OrderItems))]
        [MapperIgnoreTarget(nameof(MenuItem.Recipe))]
        public partial MenuItem CreateMenuItemRequestToMenuItem(CreateMenuItemRequest menuItemRequest);
    }
}