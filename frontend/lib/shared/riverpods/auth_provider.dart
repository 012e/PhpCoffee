import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late final FlutterSecureStorage _storage;

  AuthNotifier() {
    _storage = GetIt.I<FlutterSecureStorage>();
  }

  @override
  String? build() {
    return null; // Default: not authenticated
  }

  bool isLoggedIn() {
    return state != null;
  }

  login({required String accessToken}) async {
    await _storage.write(key: "access_token", value: accessToken);
    state = accessToken;
  }

  void logout() {
    state = null;
  }
}
