using Riok.Mapperly.Abstractions;
using WebApplication1.Controllers;
using WebApplication1.Database;
using WebApplication1.Dtos.Requests;

namespace WebApplication1.Dtos.Mappers;

[Mapper(AllowNullPropertyAssignment = false)]
public partial class IngredientMapper
{
    public partial IngredientResponse IngredientToIngredientResponse(Ingredient ingredient);

    public partial IEnumerable<IngredientResponse>
        IngredientsToIngredientResponses(IEnumerable<Ingredient> ingredients);

    public partial Ingredient CreateIngredientRequestToIngredient(CreateIngredientRequest ingredientRequest);

    public partial void UpdateIngredientFromRequest(UpdateIngredientRequest updateIngredientRequest,
        Ingredient ingredient);
}