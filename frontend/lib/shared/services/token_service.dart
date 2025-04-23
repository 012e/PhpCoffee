import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  final SharedPreferences _storage = GetIt.I<SharedPreferences>();

  Future<String?> getToken() async {
    return _storage.getString("access_token");
  }

  Future<void> setToken(String token) async {
    await _storage.setString("access_token", token);
  }

  Future<void> removetoken() async {
    await _storage.remove("access_token");
  }
}
