using Riok.Mapperly.Abstractions;
using Supabase;
using WebApplication1.Controllers;
using WebApplication1.Database;
using WebApplication1.Dtos.Requests.Users;

namespace WebApplication1.Dtos.Mappers;

[Mapper(AllowNullPropertyAssignment = false)]
public partial class UserMapper
{
    private readonly Client _supabaseClient;

    public UserMapper(Client supabaseClient)
    {
        _supabaseClient = supabaseClient;
    }

    [UserMapping(Default = false)]
    private string MapImagePathToUrl(string Picture)
    {
        return _supabaseClient
            .Storage
            .From("users")
            .GetPublicUrl(Picture);
    }
    [MapProperty(nameof(User.Picture), nameof(UserResponse.Picture), Use = nameof(MapImagePathToUrl))]
    [MapperIgnoreTarget(nameof (User.EmailVerified))]
    [MapperIgnoreTarget(nameof (User.PhoneVerified))]
    [MapperIgnoreTarget(nameof (User.CreatedAt))]
    [MapperIgnoreTarget(nameof (User.UpdatedAt))]
    public partial UserResponse UserToUserResponse(User user);

    public partial IEnumerable<UserResponse> UsersToUserResponses(IEnumerable<User> users);
    
    [MapperIgnoreTarget(nameof(User.UserId))]
    [MapperIgnoreTarget (nameof(User.EmailVerified))]
    [MapperIgnoreTarget (nameof(User.PhoneVerified))]
    [MapperIgnoreTarget (nameof(User.CreatedAt))]
    [MapperIgnoreTarget (nameof(User.Picture))]
    public partial void UpdateUserRequestToUser(UpdateUserRequest request,
        User user);
}
