import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  static const _key = 'theme_mode'; // Key for SharedPreferences

  @override
  ThemeMode build() {
    // Default to light mode initially
    _loadTheme();
    return ThemeMode.light;
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeStr = prefs.getString(_key);

    if (themeStr == 'dark') {
      state = ThemeMode.dark;
    } else if (themeStr == 'light') {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.system;
    }
  }

  Future<void> _saveTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, _themeModeToString(mode));
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.light:
        return 'light';
      case ThemeMode.system:
      default:
        return 'system';
    }
  }

  void toggle() {
    if (state == ThemeMode.light) {
      setDark();
    } else {
      setLight();
    }
  }

  void setLight() {
    state = ThemeMode.light;
    _saveTheme(state);
  }

  void setDark() {
    state = ThemeMode.dark;
    _saveTheme(state);
  }
}
