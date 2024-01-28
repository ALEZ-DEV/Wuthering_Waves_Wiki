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
        fontSize: 48,
      ),
      bodyMedium: TextStyle(
        fontSize: 30,
      ),
      bodySmall: TextStyle(
        fontSize: 24,
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
    textTheme: _baseTheme.textTheme.copyWith(
      bodyLarge: _baseTheme.textTheme.bodyLarge!.copyWith(
        color: Colors.black,
      ),
      bodyMedium: _baseTheme.textTheme.bodyMedium!.copyWith(
        color: Colors.black,
      ),
      bodySmall: _baseTheme.textTheme.bodySmall!.copyWith(
        color: Colors.black,
      ),
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
    textTheme: _baseTheme.textTheme.copyWith(
      bodyLarge: _baseTheme.textTheme.bodyLarge!.copyWith(
        color: Colors.white,
      ),
      bodyMedium: _baseTheme.textTheme.bodyMedium!.copyWith(
        color: Colors.white,
      ),
      bodySmall: _baseTheme.textTheme.bodySmall!.copyWith(
        color: Colors.white,
      ),
    ),
  );
}

class Style {
  static final bodyLarge = Theme.currentTheme.textTheme.bodyLarge;
  static final bodyMedium = Theme.currentTheme.textTheme.bodyMedium;
  static final bodySmall = Theme.currentTheme.textTheme.bodySmall;
}
