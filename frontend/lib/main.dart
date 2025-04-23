import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/routes.dart';
import 'package:frontend/shared/services/init.dart';

void main() async {
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _router = AppRouter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      child: MaterialApp.router(routerConfig: _router.config()),
    );
  }
}
