using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Supabase;
using Swashbuckle.AspNetCore.Filters;
using WebApplication1.Database;
using WebApplication1.Dtos.Mappers;

namespace WebApplication1.Helpers.Extensions;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddAppDbContext(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<ApplicationDbContext>(options =>
            options.UseNpgsql(configuration.GetConnectionString("DefaultConnection")));

        return services;
    }

    public static IServiceCollection AddMappers(this IServiceCollection services)
    {
        services.AddSingleton<IngredientMapper>();
        services.AddSingleton<MenuItemMapper>();
        services.AddSingleton<SupplierMapper>();
        services.AddSingleton<InventoryTransactionMapper>();
        return services;
    }


    public static IServiceCollection AddAppControllers(this IServiceCollection services)
    {
        services.AddControllers().AddNewtonsoftJson();

        return services;
    }

    public static IServiceCollection AddAppSwagger(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddSwaggerGen(options =>
        {
            options.OperationFilter<SecurityRequirementsOperationFilter>();
            options.AddSecurityDefinition("oauth2", new OpenApiSecurityScheme
            {
                Type = SecuritySchemeType.OAuth2,
                Flows = new OpenApiOAuthFlows
                {
                    AuthorizationCode = new OpenApiOAuthFlow
                    {
                        AuthorizationUrl = new Uri(configuration.GetValue<string>("OAuth:AuthorizationUrl")!),
                        TokenUrl = new Uri(configuration.GetValue<string>("OAuth:TokenUrl")!),
                        Scopes = new Dictionary<string, string>()
                    }
                },
                Description = "OpenID Connect Authorization Code + PKCE Flow "
            });
            options.AddSecurityRequirement(new OpenApiSecurityRequirement
            {
                {
                    new OpenApiSecurityScheme
                    {
                        Reference = new OpenApiReference
                        {
                            Type = ReferenceType.SecurityScheme,
                            Id = "oauth2"
                        }
                    },
                    new List<string> { "your-api-scope" }
                }
            });
        });

        return services;
    }

    public static IServiceCollection AddAppAuthentication(this IServiceCollection services,
        IConfiguration configuration)
    {
        services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
        {
            options.IncludeErrorDetails = true;
            options.Authority = "https://dev-z88j6uoisbogqn82.us.auth0.com/";
            options.Audience = configuration["OAuth:Audience"];
            options.TokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                ValidateIssuer = true,
                ValidateAudience = true,
                ValidAudience = configuration["OAuth:Audience"],
                ValidIssuer = configuration["OAuth:Authority"]
            };
        });

        return services;
    }

    public static IServiceCollection AddSupabase(this IServiceCollection services,
        IConfiguration configuration)
    {
        services.AddSingleton((_) =>
        {
            var supabaseUrl = configuration["Supabase:Url"]!;
            var supabaseKey = configuration["Supabase:Key"];
            return new Client(supabaseUrl, supabaseKey);
        });

        return services;
    }
}