import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/shared/services/init.dart';

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
        final token = await getIt<FlutterSecureStorage>().read(
          key: "access_token",
        );
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
