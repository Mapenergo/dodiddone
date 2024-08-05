import 'package:flutter/material.dart';

class DoDidDoneTheme {
  static ThemeData lightTheme = ThemeData(
    // Define your two colors
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9f7bf6), // #9f7bf6
      primary: const Color(0xFF4ceb8b), // #4ceb8b
      secondary: const Color(0xFF9f7bf6), // #9f7bf6
    ),
    useMaterial3: true,
    // Add elevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Default text color
        textStyle: const TextStyle(fontSize: 18, color: Colors.white), // Default text style
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Default padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Default border radius
        ),
      ),
    ),
  );
}