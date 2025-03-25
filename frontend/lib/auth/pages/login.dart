import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/auth/widgets/login.dart';
import 'package:frontend/shared/riverpods/authProvider.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authProvider);
    if (isAuthenticated) {
      context.go("/");
      return const Placeholder();
    } else {
      return LoginPage(
        onLogin: (email, password) {
          return ref
              .read(authProvider.notifier)
              .login(email: email, password: password);
        },
      );

      // return Scaffold(
      //   appBar: AppBar(title: Text('Login')),
      //   body:       );
    }
  }
}
