import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: AutoLeadingButton(
          showIfParentCanPop: false,
          ignorePagelessRoutes: true,
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(width: 900, child: AutoRouter()),
      ),
    );
  }
}
