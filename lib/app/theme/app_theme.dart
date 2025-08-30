// app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App theme definitions (light and dark) used by the application.
///
/// This class only exposes static getters and provides a private
/// constructor to make it clear it should not be instantiated.
class AppTheme {
  AppTheme._();

  /// Build a light theme using [seedColor].
  static ThemeData lightTheme(
    final BuildContext context,
    final Color seedColor,
    final String fontFamily,
  ) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    );

    final TextTheme textTheme =
        GoogleFonts.getTextTheme(fontFamily, Theme.of(context).textTheme).apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        );

    final CardThemeData cardTheme = CardThemeData(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );

    final InputDecorationThemeData inputDecoration = InputDecorationThemeData(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );

    return ThemeData.from(
      colorScheme: colorScheme,
      textTheme: textTheme,
    ).copyWith(cardTheme: cardTheme, inputDecorationTheme: inputDecoration);
  }

  /// Build a dark theme using [seedColor].
  static ThemeData darkTheme(
    final BuildContext context,
    final Color seedColor,
    final String fontFamily,
  ) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: seedColor,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    );

    final TextTheme textTheme =
        GoogleFonts.getTextTheme(fontFamily, Theme.of(context).textTheme).apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        );

    final CardThemeData cardTheme = CardThemeData(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );

    final InputDecorationThemeData inputDecoration = InputDecorationThemeData(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );

    return ThemeData.from(
      colorScheme: colorScheme,
      textTheme: textTheme,
    ).copyWith(cardTheme: cardTheme, inputDecorationTheme: inputDecoration);
  }
}
