import 'package:flutter/material.dart';

abstract class Fonts {
  static const textLightTheme = TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w500,
    ),
  );

  static const textDarkTheme = TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );
}
