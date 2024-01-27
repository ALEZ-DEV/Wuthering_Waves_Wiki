import 'package:flutter/material.dart';

class Theme {
  static ThemeMode _currentMode = ThemeMode.system;

  static ThemeMode get currentMode => _currentMode;

  static void setCurrentMode(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    if (brightness == Brightness.dark) {
      _currentMode = ThemeMode.dark;
    } else {
      _currentMode = ThemeMode.light;
    }
  }

  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFC4AC7D),
      brightness: Brightness.light,
    ),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: Color(0xFFC4AC7D),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.yellow,
      selectionColor: Colors.green,
      selectionHandleColor: Colors.blue,
    ),
  );

  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3B3426),
      brightness: Brightness.dark,
    ),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: Color(0xFF3B3426),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.yellow,
      selectionColor: Colors.green,
      selectionHandleColor: Colors.blue,
    ),
  );
}
