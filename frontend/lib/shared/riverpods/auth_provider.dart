import 'package:frontend/shared/services/token_service.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  login({required String accessToken}) async {
    await _tokenService.setToken(accessToken);
    state = accessToken;
  }

  void logout() async {
    await _tokenService.removetoken();
    state = null;
  }
}
