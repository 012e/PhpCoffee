using WebApplication1.Controllers;
using WebApplication1.Helpers.Extensions;
using WebApplication1.Middlewares;
using WebApplication1.Services;
using System.Net.Http.Headers;

var builder = WebApplication.CreateBuilder(args);

builder.Services
    .AddAppControllers()
    .AddEndpointsApiExplorer()
    .AddMappers()
    .AddSingleton<IngredientImageService>()
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
app.MapControllers();

app.Run();