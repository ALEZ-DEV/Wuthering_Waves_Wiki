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

  static ThemeData get currentTheme {
    if (_currentMode == ThemeMode.dark) {
      return dark;
    }
    return light;
  }

  //only edit for non-color related thing, this theme will impact the light and dark theme
  static final _baseTheme = ThemeData(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 72,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 30,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
    ),
  );

  static final light = _baseTheme.copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFC4AC7D),
      brightness: Brightness.light,
    ),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: Color(0xFFC4AC7D),
    ),
  );

  static final dark = _baseTheme.copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3B3426),
      brightness: Brightness.dark,
    ),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: Color(0xFF3B3426),
    ),
  );
}

class Style {
  static final bodyLarge = Theme.currentTheme.textTheme.bodyLarge;
  static final bodyMedium = Theme.currentTheme.textTheme.bodyMedium;
  static final bodySmall = Theme.currentTheme.textTheme.bodySmall;
}
