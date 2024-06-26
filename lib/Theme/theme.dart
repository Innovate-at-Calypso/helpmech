import 'package:flutter/material.dart';

class AppTheme {
  static LinearGradient lightThemePrimary = LinearGradient(
    colors: [Colors.black, Color.fromARGB(255, 8, 0, 246)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient lightThemeSecondary = LinearGradient(
    colors: [Colors.orange, Colors.deepOrange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
