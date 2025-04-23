import 'package:dio/dio.dart';
import 'package:frontend/shared/services/dio.dart';
import 'package:frontend/shared/services/token_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingletonAsync<SharedPreferences>(() async {
    final sh = await SharedPreferences.getInstance();
    return sh;
  });
  await GetIt.instance.isReady<SharedPreferences>();
  getIt.registerSingleton<TokenService>(TokenService());
  getIt.registerLazySingleton<Dio>(() => createDio());
  await getIt.allReady();
}
