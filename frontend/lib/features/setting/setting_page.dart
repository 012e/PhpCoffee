import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/shared/riverpods/auth_provider.dart';
import 'package:frontend/shared/routes.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  // void _logout(WidgetRef ref) {
  //   GetIt.I<FlutterSecureStorage>().delete(key: "access_token");
  //   ref.read(authNotifierProvider.notifier).logout();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = AutoRouter.of(context);
    var showGoBack = true;
    if (router.currentChild?.name == "") {
      showGoBack = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: showGoBack ? AutoLeadingButton() : null,
      ),
      body: AutoRouter(),
    );
  }
}
