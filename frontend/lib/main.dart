import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/riverpods/theme_provider.dart'; // Assuming this provider exists
import 'package:frontend/shared/routes.dart'; // Assuming this defines AppRouter
import 'package:frontend/shared/services/init.dart'; // Assuming this defines setupLocator

void main() async {
  // Ensure initialization is complete before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // Define the custom light theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3:
        true, // Enable Material 3 for updated color system and components
    colorScheme: ColorScheme.light(
      // Primary color (used for buttons, active states, etc.)
      primary: const Color(
        0xFF6366F1,
      ), // Found in buttons, icons, data table ID, edit button
      onPrimary: Colors.white, // Contrast color for primary
      // Secondary color (can be used for accents)
      secondary: const Color(
        0xFF059669,
      ), // Found in price color and active status
      onSecondary: Colors.white, // Contrast color for secondary
      // Error color (used for errors, warnings)
      error: const Color(
        0xFFDC2626,
      ), // Found in inactive status and delete button
      onError: Colors.white, // Contrast color for background
      // Surface color (used for cards, sheets, dialogs - base level)
      surface: const Color(0xFFF8F9FA), // Base surface color
      onSurface: Colors.black87, // Contrast color for surface
      // Outline color (used for borders)
      outline: const Color(0xFFD1D5DB), // Found in outlined button borders
    ),
    // Customize specific component themes
    // Keep light mode card color using the color scheme for consistency
    cardColor: Colors.white,
    dividerColor: Colors.black12, // Found in data table border
    scaffoldBackgroundColor:
        Colors.transparent, // Set in the screen's Container gradient
    // Text colors from usage:
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black87), // Default text color
      titleLarge: TextStyle(color: Colors.black87), // Header text color
      bodySmall: TextStyle(color: Colors.black54), // Sub-text color
    ),
    // Customize button styles
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6366F1), // Used for primary buttons
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF6366F1), // Used for filter buttons
        side: const BorderSide(color: Color(0xFFD1D5DB)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.black.withValues(
          alpha: 0.05,
        ), // Used for header icons
        foregroundColor: Colors.black87,
      ),
    ),
    // Customize input decoration for TextField
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: const Color(0xFF6366F1), // Search bar prefix icon color
      hintStyle: const TextStyle(color: Colors.black54), // Hint text style
    ),
    // Customize dialog appearance
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor:
          ThemeData.light()
              .colorScheme
              .surfaceContainerHigh, // Dialog background
      surfaceTintColor:
          Colors.transparent, // Remove default Material 3 surface tint
    ),
  );

  // Define the custom dark theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true, // Enable Material 3
    colorScheme: ColorScheme.dark(
      // Primary color (used for buttons, active states, etc.)
      primary: const Color(
        0xFF6366F1,
      ), // Found in buttons, icons, data table ID, edit button
      onPrimary: Colors.white, // Contrast color for primary
      // Secondary color (can be used for accents)
      secondary: const Color(
        0xFF059669,
      ), // Found in price color and active status
      onSecondary: Colors.white, // Contrast color for secondary
      // Error color (used for errors, warnings)
      error: const Color(
        0xFFDC2626,
      ), // Found in inactive status and delete button
      onError: Colors.white, // Contrast color for background
      // Surface color (used for cards, sheets, dialogs - base level)
      surface: const Color(0xFF1A1F38), // Base surface color
      onSurface: Colors.white, // Contrast color for surface
      // Outline color (used for borders) - Reusing light mode color as seen in OutlinedButton
      outline: const Color(
        0xFFD1D5DB,
      ), // Found in outlined button borders (might need adjustment for dark mode contrast)
    ),
    // Customize specific component themes
    // Manually assigned cardColor for dark mode, further lightened
    cardColor: const Color.fromARGB(
      255,
      27,
      56,
      106,
    ), // Adjusted to a slightly lighter dark blue-grey
    dividerColor: Colors.white12, // Found in data table border
    scaffoldBackgroundColor:
        Colors.transparent, // Set in the screen's Container gradient
    // Text colors from usage:
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white), // Default text color
      titleLarge: TextStyle(color: Colors.white), // Header text color
      bodySmall: TextStyle(color: Colors.white70), // Sub-text color
    ),
    // Customize button styles
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6366F1), // Used for primary buttons
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor:
            Colors.white70, // Used for filter buttons (adjusted for dark mode)
        side: const BorderSide(
          color: Color(0xFFD1D5DB),
        ), // Might need a darker border color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white10, // Used for header icons
        foregroundColor: Colors.white,
      ),
    ),
    // Customize input decoration for TextField
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: const Color(0xFF6366F1), // Search bar prefix icon color
      hintStyle: const TextStyle(color: Colors.white70), // Hint text style
    ),
    // Customize dialog appearance
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor:
          ThemeData.dark()
              .colorScheme
              .surfaceContainerHigh, // Dialog background
      surfaceTintColor:
          Colors.transparent, // Remove default Material 3 surface tint
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(
      themeNotifierProvider,
    ); // Assuming this provides ThemeMode

    final router = AppRouter(); // Assuming this is your AutoRouter setup

    return MaterialApp.router(
      routerConfig: router.config(),
      themeMode: themeMode,
      theme: lightTheme, // Use the custom light theme
      darkTheme: darkTheme, // Use the custom dark theme
      debugShowCheckedModeBanner: false, // Optional: hide debug banner
    );
  }
}
