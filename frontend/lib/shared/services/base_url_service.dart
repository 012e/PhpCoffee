import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseUrlService {
  final SharedPreferencesWithCache _sharedPreferences =
      GetIt.I<SharedPreferencesWithCache>();

  static final String defaultBaseUrl = 'http://localhost:5045';

  String getBaseUrl() {
    final url = _sharedPreferences.getString('baseUrl');
    if (url == null || url.isEmpty) {
      return defaultBaseUrl;
    }
    return url;
  }

  Future<void> setBaseUrl(String url) async {
    await _sharedPreferences.setString('baseUrl', url);
    await _sharedPreferences.reloadCache();
  }
}
