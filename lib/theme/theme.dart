import 'package:flutter/material.dart';

// Light Mode Theme
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    
      background: Color.fromARGB(255, 244, 244, 244), // Light background
      primary: Color.fromARGB(255, 62, 21, 137), // Purple
      secondary: Color.fromARGB(255, 185, 99, 99), // Muted Red
      onPrimary: Color.fromARGB(255, 139, 109, 195),
      onBackground: Color.fromARGB(182, 255, 255, 255), // Grayish Pink
      primaryVariant: Color.fromARGB(142, 250, 193, 5), // Light Purple
      secondaryVariant: Color.fromARGB(255, 126, 125, 125),
      onSecondary: Colors.black // Light Red
      ),
);

// Dark Mode Theme
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    
      background: Color.fromARGB(255, 35, 11, 79), // Dark Purple
      primary: Colors.white, // White text
      secondary: Color.fromARGB(255, 241, 219, 237), // Pale Pink
      onBackground: Color.fromARGB(49, 255, 255, 255), // Soft Pink
      primaryVariant: Color.fromARGB(255, 180, 79, 79), // Muted Red
      secondaryVariant: Color.fromARGB(255, 189, 168, 197),
      onSecondary: Colors.white // Light Red
      // Bright Red
      ),
);
