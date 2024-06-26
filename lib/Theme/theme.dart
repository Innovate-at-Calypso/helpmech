import 'package:flutter/material.dart';

class ThemeClass {
  static Color lightThemePrimary = Color.fromARGB(255, 255, 255, 255);
  static Color lightThemeSecondary = Color.fromARGB(255, 0, 0, 0);
  static Color darkThemePrimary = Color.fromARGB(255, 0, 0, 0);
  static Color darkThemeSecondary = Color.fromARGB(255, 255, 255, 255);

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light().copyWith(
      primary: lightThemePrimary,
      secondary: lightThemeSecondary,
    ),
    scaffoldBackgroundColor: lightThemePrimary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => lightThemeSecondary),
      ),
    ),
    iconTheme: IconThemeData(color: lightThemeSecondary),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark().copyWith(
      primary: darkThemePrimary,
      secondary: darkThemeSecondary,
    ),
    scaffoldBackgroundColor: darkThemePrimary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => darkThemeSecondary),
      ),
    ),
    iconTheme: IconThemeData(color: darkThemeSecondary),
  );
}
