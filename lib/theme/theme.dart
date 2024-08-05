import 'package:flutter/material.dart';

class DoDidDoneTheme {
  static ThemeData lightTheme = ThemeData(
    // Define your two colors
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF9f7bf6), // #9f7bf6
      primary: const Color(0xFF4ceb8b), // #4ceb8b
    ),
    useMaterial3: true,
  );
}