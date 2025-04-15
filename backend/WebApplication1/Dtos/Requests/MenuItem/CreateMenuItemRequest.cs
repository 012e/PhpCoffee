using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication1.Dtos.Requests.Recipe;

namespace WebApplication1.Dtos.Requests.MenuItem
{
    public class CreateMenuItemRequest
    {
        public string ItemName { get; set; } = null!;

        public string? Description { get; set; }

        public decimal BasePrice { get; set; }

        public bool? IsActive { get; set; }

        public CreateRecipeRequest Recipe { get; set; } = new CreateRecipeRequest();
    }
}