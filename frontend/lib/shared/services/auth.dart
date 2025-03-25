import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false; // Default: not authenticated
  }

  bool login({required String email, required String password}) {
    state = true;
    return true;
  }

  bool logout() {
    state = false;
    return true;
  }
}
