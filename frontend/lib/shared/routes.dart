import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/auth/pages/login.dart';
import 'package:frontend/auth/pages/login_oidc.dart';
import 'package:frontend/setting/pages/setting_home.dart';
import 'package:frontend/shared/riverpods/authProvider.dart';
import 'package:go_router/go_router.dart';

typedef HomePage = SettingPage;

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const _AuthGuard()),
    GoRoute(
      path: '/auth/login',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);

class _AuthGuard extends ConsumerWidget {
  const _AuthGuard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authProvider);
    if (isAuthenticated) {
      return const HomePage();
    } else {
      return const LoginScreen();
    }
  }
}
