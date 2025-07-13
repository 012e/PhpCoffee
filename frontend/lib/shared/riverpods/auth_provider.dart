import 'package:frontend/shared/services/token_service.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  final _tokenService = GetIt.I<TokenService>();

  @override
  String? build() {
    return null;
  }

  bool isLoggedIn() {
    return state != null;
  }

  login({required String accessToken, String? idToken}) async {
    await _tokenService.setToken(accessToken);
    if (idToken != null) {
      await _tokenService.setIdToken(idToken);
    }
    state = accessToken;
  }

  Future<void> logout({String? postLogoutRedirectUri, bool federated = false}) async {
    final idToken = await _tokenService.getIdToken();
    
    // Perform federated logout with Auth0
    if (idToken != null) {
      await _performFederatedLogout(idToken, postLogoutRedirectUri, federated);
    }
    
    // Clear local tokens
    await _tokenService.removetoken();
    state = null;
  }

  Future<void> _performFederatedLogout(String idToken, String? postLogoutRedirectUri, bool federated) async {
    const auth0Domain = "dev-z88j6uoisbogqn82.us.auth0.com";
    
    // Build OIDC logout URL according to Auth0 documentation
    final queryParams = <String, String>{
      'id_token_hint': idToken,
    };
    
    if (postLogoutRedirectUri != null) {
      queryParams['post_logout_redirect_uri'] = postLogoutRedirectUri;
    }
    
    // Add federated parameter to log user out of identity provider
    if (federated) {
      queryParams['federated'] = '';
    }
    
    final logoutUrl = Uri.https(auth0Domain, '/oidc/logout', queryParams);

    // Open logout URL in external browser
    if (await canLaunchUrl(logoutUrl)) {
      await launchUrl(logoutUrl, mode: LaunchMode.externalApplication);
    }
  }
}
