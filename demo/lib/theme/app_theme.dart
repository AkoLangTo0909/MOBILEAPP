import 'package:flutter/material.dart';

const Color primaryRed = Color(0xFFE50914);
const Color backgroundColor = Color(0xFF05070C);
const Color cardColor = Color(0xFF111827);
const Color cardColor2 = Color(0xFF172238);
const Color textMuted = Color(0xFF9CA3AF);

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryRed,
        brightness: Brightness.dark,
      ),
      fontFamily: 'Arial',
      useMaterial3: true,
    );
  }
}
