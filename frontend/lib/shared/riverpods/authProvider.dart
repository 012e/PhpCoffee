import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/services/auth.dart';

final authProvider = NotifierProvider<AuthNotifier, bool>(() {
  return AuthNotifier();
});
