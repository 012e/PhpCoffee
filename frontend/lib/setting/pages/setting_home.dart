import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/riverpods/authProvider.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  void _logout(WidgetRef ref) {
    ref.read(authProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return ElevatedButton(
      onPressed: () {
        _logout(ref);
      },
      child: Text('Logout'),
    );
  }
}
