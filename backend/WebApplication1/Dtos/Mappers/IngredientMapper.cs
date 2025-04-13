using Riok.Mapperly.Abstractions;
using Supabase;
using WebApplication1.Controllers;
using WebApplication1.Database;
using WebApplication1.Dtos.Requests;

namespace WebApplication1.Dtos.Mappers;

[Mapper(AllowNullPropertyAssignment = false)]
public partial class IngredientMapper
{
    private readonly Client _supabaseClient;

    public IngredientMapper(Client supabaseClient)
    {
        _supabaseClient = supabaseClient;
    }

    [UserMapping(Default = false)]
    private string MapImagePathToUrl(string imagePath)
    {
        return _supabaseClient
            .Storage
            .From("ingredients")
            .GetPublicUrl(imagePath);
    }

    [MapProperty(nameof(Ingredient.ImageUrl), nameof(IngredientResponse.ImageUrl), Use = nameof(MapImagePathToUrl))]
    public partial IngredientResponse IngredientToIngredientResponse(Ingredient ingredient);

    public partial IEnumerable<IngredientResponse>
        IngredientsToIngredientResponses(IEnumerable<Ingredient> ingredients);

    [MapperIgnoreTarget(nameof(Ingredient.IngredientId))]
    [MapperIgnoreTarget(nameof(Ingredient.CreatedAt))]
    [MapperIgnoreTarget(nameof(Ingredient.ImageUrl))]
    [MapperIgnoreTarget(nameof(Ingredient.RecipeIngredients))]
    [MapperIgnoreTarget(nameof(Ingredient.InventoryTransactionDetails))]
    [MapperIgnoreTarget(nameof(Ingredient.Supplier))]
    public partial Ingredient CreateIngredientRequestToIngredient(CreateIngredientRequest ingredientRequest);

    [MapperIgnoreTarget(nameof(Ingredient.IngredientId))]
    [MapperIgnoreTarget(nameof(Ingredient.CreatedAt))]
    [MapperIgnoreTarget(nameof(Ingredient.ImageUrl))]
    [MapperIgnoreTarget(nameof(Ingredient.RecipeIngredients))]
    [MapperIgnoreTarget(nameof(Ingredient.InventoryTransactionDetails))]
    [MapperIgnoreTarget(nameof(Ingredient.Supplier))]
    public partial void UpdateIngredientFromRequest(UpdateIngredientRequest updateIngredientRequest,
        Ingredient ingredient);
}