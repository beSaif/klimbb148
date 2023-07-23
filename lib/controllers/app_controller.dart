import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  ThemeData _themeData = defaultThemeData;
  ThemeData get themeData => _themeData;
  void setThemeData(ThemeData value) {
    _themeData = value;
    notifyListeners();
  }
}

ColorScheme colorScheme = ColorScheme.fromSwatch().copyWith(
  primary: Colors.brown.shade800,
  secondary: Colors.brown,
  background: Colors.brown.shade100,
  tertiary: Colors.white70,
);
ThemeData defaultThemeData = ThemeData(
    scaffoldBackgroundColor: colorScheme.background,
    appBarTheme: AppBarTheme(color: colorScheme.primary),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        bodyMedium: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        bodySmall: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white),
        displayLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        displayMedium: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        displaySmall: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
    colorScheme: colorScheme);
