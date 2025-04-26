import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/riverpods/auth_provider.dart';
import 'package:frontend/shared/riverpods/theme_provider.dart';
import 'package:frontend/shared/services/token_service.dart';
import 'package:get_it/get_it.dart';
import 'package:settings_ui/settings_ui.dart';

@RoutePage()
class SettingListPage extends ConsumerWidget {
  SettingListPage({super.key});
  final tokenStorage = GetIt.I<TokenService>();

  Future<void> _logout(WidgetRef ref) async {
    await tokenStorage.removetoken();
    ref.read(authNotifierProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = AutoRouter.of(context);
    final theme = Theme.of(context);
    final dangerColor = theme.colorScheme.error;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final SettingsThemeData defaultSettingsTheme = SettingsThemeData(
      settingsListBackground: colorScheme.surface,
      settingsSectionBackground: colorScheme.surface,
      tileHighlightColor: colorScheme.primary.withAlpha(50),
      leadingIconsColor: colorScheme.onSurfaceVariant,
      settingsTileTextColor: textTheme.bodyMedium?.color,
      tileDescriptionTextColor: textTheme.bodySmall?.color,
      titleTextColor: textTheme.titleLarge?.color,
      trailingTextColor: textTheme.bodyMedium?.color,
      dividerColor: theme.dividerColor,
    );

    final themeMode = ref.watch(themeNotifierProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    var sections = [
      SettingsSection(
        title: Text('General'),
        tiles: [
          SettingsTile.switchTile(
            title: Text('Dark Mode'),
            leading: Icon(Icons.dark_mode),
            initialValue: isDarkMode,
            onToggle: (value) {
              ref.read(themeNotifierProvider.notifier).toggle();
            },
          ),
          SettingsTile.navigation(
            title: Text('Abstract settings screen'),
            leading: Icon(Icons.settings),
            description: Text('UI created to show plugin\'s possibilities'),
            onPressed: (context) {
              router.navigatePath("/settings/profile");
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
              router.navigatePath("/settings/profile");
            },
          ),
          SettingsTile.navigation(
            leading: Icon(Icons.logout, color: dangerColor),
            title: Text('Logout', style: TextStyle(color: dangerColor)),
            description: Text(
              "Dangerous: Logout of current account",
              style: TextStyle(color: dangerColor),
            ),
            onPressed: (context) {
              _showDialog(context, ref, dangerColor);
            },
          ),
        ],
      ),
    ];

    return SettingsList(
      lightTheme: defaultSettingsTheme,
      applicationType: ApplicationType.material,
      sections: sections,
    );
  }

  void _showDialog(BuildContext context, WidgetRef ref, Color dangerColor) {
    final router = AutoRouter.of(context);
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(), // cancel
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop(); // close dialog
                await _logout(ref); // perform logout
                router.navigatePath("/auth/login");
              },
              style: TextButton.styleFrom(foregroundColor: dangerColor),
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}
