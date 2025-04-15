using WebApplication1.Dtos.Requests.RecipeIngredient;

namespace WebApplication1.Dtos.Requests.Recipe
{
    public class CreateRecipeRequest
    {
        public string Name { get; set; } = null!;

        public string? Description { get; set; }

        public string Instructions { get; set; } = null!;

        public ICollection<CreateRecipeIngredientRequest> RecipeIngredients { get; set; } = new List<CreateRecipeIngredientRequest>();
    }
}