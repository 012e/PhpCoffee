import 'package:dio/dio.dart';
import 'package:frontend/shared/services/init.dart';
import 'package:frontend/shared/services/token_service.dart';

Dio createDio() {
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
        final tokenService = getIt<TokenService>();
        final token = await tokenService.getToken();
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
