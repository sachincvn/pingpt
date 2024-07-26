import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryColor = Color.fromARGB(255, 0, 0, 0);
  static const Color lightColor = Color(0xFFF5F5FD);
  static const Color grayColor = Color(0xFFCED3DC);

  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: primaryColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(color: grayColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(color: grayColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(color: secondaryColor),
    ),
    hintStyle: const TextStyle(color: grayColor),
    labelStyle: const TextStyle(color: secondaryColor),
    errorStyle: const TextStyle(color: Colors.red),
    contentPadding:
        const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      background: lightColor,
    ),
    scaffoldBackgroundColor: lightColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
      bodyLarge: TextStyle(fontWeight: FontWeight.normal, color: primaryColor),
      bodyMedium: TextStyle(fontWeight: FontWeight.normal, color: primaryColor),
    ),
    inputDecorationTheme: inputDecorationTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      background: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      displayLarge:
          TextStyle(fontWeight: FontWeight.bold, color: secondaryColor),
      bodyLarge:
          TextStyle(fontWeight: FontWeight.normal, color: secondaryColor),
      bodyMedium:
          TextStyle(fontWeight: FontWeight.normal, color: secondaryColor),
    ),
    inputDecorationTheme: inputDecorationTheme,
  );

  static Gradient gradientBackground() => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.1, 0.4, 0.8],
        colors: [
          Color(0xFF592e99), // #4b297e
          Color(0xFF382464), // #392463
          Color(0xFF282348), // #282348
        ],
      );
}
