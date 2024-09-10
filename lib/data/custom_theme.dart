import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  ThemeData themeDataLight = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 14),
    ),
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.white, elevation: 10),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromRGBO(208, 208, 208, 1.0),
      onPrimary: Color.fromRGBO(10, 10, 1, 1),
      secondary: Colors.green,
      onSecondary: Color.fromRGBO(10, 10, 1, 1),
      error: Color.fromRGBO(228, 32, 33, 1),
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
  );

  ThemeData themeDataDark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 14),
    ),
    appBarTheme:
        const AppBarTheme(backgroundColor: Color.fromRGBO(43, 55, 67, 1), elevation: 10),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(208, 208, 208, 1.0),
      onPrimary: Color.fromRGBO(10, 10, 1, 1),
      secondary: Colors.green,
      onSecondary: Color.fromRGBO(10, 10, 1, 1),
      error: Color.fromRGBO(228, 32, 33, 1),
      onError: Colors.white,
      surface: Color.fromRGBO(43, 55, 67, 1),
      onSurface: Colors.white,
    ),
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
  );
}
