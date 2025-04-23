import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

@RoutePage()
class SettingListPage extends ConsumerWidget {
  const SettingListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = AutoRouter.of(context);
    final theme = Theme.of(context);
    final dangerColor = theme.colorScheme.error;

    var sections = [
      SettingsSection(
        title: Text('General'),
        tiles: [
          SettingsTile.navigation(
            title: Text('Abstract settings screen'),
            leading: Icon(Icons.settings),
            description: Text('UI created to show plugin\'s possibilities'),
            onPressed: (context) {
              router.pushPath("/settings/profile");
            },
          ),
        ],
      ),
      SettingsSection(
        title: Text('Profile'),
        tiles: [
          SettingsTile.navigation(
            title: Text('User profile'),
            leading: Icon(Icons.group),
            description: Text('See information of current logged in user'),
            onPressed: (context) {
              router.pushPath("/settings/profile");
            },
          ),
          SettingsTile.navigation(
            leading: Icon(Icons.logout, color: dangerColor),
            title: Text('Logout', style: TextStyle(color: dangerColor)),
            description: Text(
              "Dangerous: Logout of current account",
              style: TextStyle(color: dangerColor),
            ),
            onPressed: (context) {},
          ),
        ],
      ),
    ];

    return SettingsList(
      applicationType: ApplicationType.material,
      sections: sections,
    );
  }
}
