import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/riverpods/theme_provider.dart';
import 'package:frontend/shared/routes.dart';
import 'package:frontend/shared/services/init.dart';

void main() async {
  await setupLocator();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider); // <-- Watch theme

    final _router = AppRouter();

    return MaterialApp.router(
      routerConfig: _router.config(),
      themeMode: themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
