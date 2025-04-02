using Supabase;
using FileOptions = Supabase.Storage.FileOptions;

namespace WebApplication1.Services;

public class IngredientImageService
{
    private const string _bucketName = "ingredients";
    private readonly Client _supabaseClient;

    public IngredientImageService(Client supabaseClient)
    {
        _supabaseClient = supabaseClient;
    }

    public async Task<string> UpsertIngredientImageAsync(IFormFile file, int ingredientId)
    {
        if (file == null || file.Length == 0)
            throw new ArgumentException("Invalid file");

        var fileExtension = Path.GetExtension(file.FileName);
        var path = $"images/{ingredientId}{fileExtension}";

        using var memoryStream = new MemoryStream();
        await file.CopyToAsync(memoryStream);
        memoryStream.Position = 0;


        await _supabaseClient.Storage
            .From(_bucketName)
            .Upload(memoryStream.ToArray(),
                path,
                new FileOptions()
                {
                    CacheControl = "3600",
                    Upsert = true,
                    ContentType = file.ContentType
                });
        return path;
    }
}