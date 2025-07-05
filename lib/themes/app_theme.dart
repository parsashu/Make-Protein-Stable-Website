import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1a237e);
  static const Color secondaryColor = Color(0xFF3949ab);
  static const Color accentColor = Color(0xFF5c6bc0);
  static const Color textPrimary = Color(0xFF424242);
  static const Color textSecondary = Color(0xFF616161);
  static const Color successColor = Color(0xFF2e7d32);

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: primaryColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: textPrimary,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: textSecondary,
          height: 1.5,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
