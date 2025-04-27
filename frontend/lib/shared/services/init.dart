import 'package:dio/dio.dart';
import 'package:frontend/shared/services/api.dart';
import 'package:frontend/shared/services/base_url_service.dart';
import 'package:frontend/shared/services/dio.dart';
import 'package:frontend/shared/services/token_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    final sh = await SharedPreferences.getInstance();
    return sh;
  });
  getIt.registerSingletonAsync<SharedPreferencesWithCache>(() async {
    return await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
  });
  await GetIt.instance.isReady<SharedPreferences>();
  await GetIt.instance.isReady<SharedPreferencesWithCache>();
  getIt.registerSingleton<TokenService>(TokenService());
  getIt.registerSingleton<BaseUrlService>(BaseUrlService());
  getIt.registerLazySingleton<Dio>(() => createDio());
  setupApis();
  await getIt.allReady();
}
