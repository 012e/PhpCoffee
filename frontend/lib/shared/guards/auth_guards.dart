import 'package:auto_route/auto_route.dart';
import 'package:frontend/shared/routes.dart';
import 'package:frontend/shared/services/token_service.dart';
import 'package:get_it/get_it.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final storage = GetIt.I<TokenService>();
    var token = await storage.getToken();

    if (token != null) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirectUntil to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirectUntil(const LoginRoute());
    }
  }
}
