import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/routes.dart';
import 'package:frontend/shared/services/init.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(child: MaterialApp.router(routerConfig: router));
  }
}
