namespace WebApplication1.Dtos.Requests.RecipeIngredient
{
    public class CreateRecipeIngredientRequest
    {
        public int IngredientId { get; set; }

        public decimal Quantity { get; set; }
    }
}