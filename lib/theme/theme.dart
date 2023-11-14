import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.grey, // Set your desired background color
  ),
  colorScheme: const ColorScheme.light(
      // Your color scheme properties
      ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor:
        Colors.black, // Set your desired dark mode background color
  ),
  // Your other dark mode properties
);
