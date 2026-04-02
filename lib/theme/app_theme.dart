import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryOrange = Color(0xFFE85D04);
  static const Color accentOrange = Color(0xFFFF7A3D);
  static const Color lightPeach = Color(0xFFFFEEE7);
  static const Color background = Color(0xFFF7F4F2);
  static const Color cardWhite = Colors.white;
  static const Color textDark = Color(0xFF1F1F1F);
  static const Color textMuted = Color(0xFF7A6F69);
  static const Color borderColor = Color(0xFFE9E2DD);
  static const Color chipInactive = Color(0xFFF1EEEC);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: background,
    fontFamily: 'Arial',
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryOrange,
      primary: primaryOrange,
      secondary: accentOrange,
      background: background,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: textDark),
      titleTextStyle: TextStyle(
        color: textDark,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: textDark,
      ),
      headlineMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: textDark,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textDark,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textDark,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: textDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: textMuted,
      ),
    ),
  );
}