using WebApplication1.Helpers.Extensions;
using WebApplication1.Middlewares;
using WebApplication1.Services;

var builder = WebApplication.CreateBuilder(args);

builder.Services
    .AddAppControllers()
    .AddEndpointsApiExplorer()
    .AddMappers()
    .AddAuth0Admin(builder.Configuration)
    .AddSingleton<IngredientImageService>()
    .AddSingleton<UserSyncer>()
    .AddSupabase(builder.Configuration)
    .AddAppSwagger(builder.Configuration)
    .AddAppDbContext(builder.Configuration)
    .AddExceptionHandler<GlobalExceptionHandler>()
    .AddAppAuthentication(builder.Configuration);


var app = builder.Build();

app.UseExceptionHandler("/error");

app.ConfigureSwagger(builder.Configuration);
app.UseAuthentication();
app.UseAuthorization();
app.UseMiddleware<UserSyncer>();

app.MapControllers();

app.Run();