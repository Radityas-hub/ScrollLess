import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF4F46E5),
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFFF7F7FC),
      cardTheme: const CardThemeData(elevation: 0, margin: EdgeInsets.zero),
      navigationBarTheme: const NavigationBarThemeData(height: 72),
    );
  }
}
