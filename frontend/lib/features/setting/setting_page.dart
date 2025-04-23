import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = AutoRouter.of(context);
    var showGoBack = true;
    if (router.currentPath == "settings") {
      showGoBack = false;
    }

    return Scaffold(
      appBar:
          showGoBack
              ? AppBar(title: Text("Settings"), leading: AutoLeadingButton())
              : AppBar(
                title: Text("Settings"),
                automaticallyImplyLeading: false,
              ),
      body: AutoRouter(),
    );
  }
}
