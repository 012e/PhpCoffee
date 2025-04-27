import 'package:dio/dio.dart';
import 'package:frontend/shared/services/base_url_service.dart';
import 'package:frontend/shared/services/init.dart';
import 'package:frontend/shared/services/token_service.dart';

Dio createDio() {
  final tokenService = getIt<TokenService>();
  final BaseUrlService baseUrlService = getIt<BaseUrlService>();

  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:5045',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await tokenService.getToken();
        options.baseUrl = baseUrlService.getBaseUrl();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        // Handle token expiration (optional)
        if (error.response?.statusCode == 401) {
          // Handle unauthorized error (e.g., force logout)
        }
        return handler.next(error);
      },
    ),
  );

  return dio;
}
