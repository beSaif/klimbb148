import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends ChangeNotifier {
  AppController() {
    checkIsFirstLaunch().then((value) {
      setisFirstLaunch(value);
      setisLoading(false);
    });
  }

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  void setisLoading(bool value) {
    _isLoading = value;
    debugPrint("isLoading: $_isLoading");
    notifyListeners();
  }

  bool _isFirstLaunch = false;
  bool get isFirstLaunch => _isFirstLaunch;
  void setisFirstLaunch(bool value) {
    _isFirstLaunch = value;
    debugPrint("isFirstLaunch: $_isFirstLaunch");
    notifyListeners();
  }

  Future<bool> checkIsFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLaunch = prefs.getBool('isFirstLaunch');
    if (isFirstLaunch == null) {
      prefs.setBool('isFirstLaunch', false);
      return true;
    }
    return false;
  }

  ThemeData _themeData = defaultThemeData;
  ThemeData get themeData => _themeData;
  void setThemeData(ThemeData value) {
    _themeData = value;
    notifyListeners();
  }
}

ThemeData defaultThemeData = ThemeData(
    scaffoldBackgroundColor: colorScheme.background,
    appBarTheme: AppBarTheme(color: colorScheme.primary),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: textTheme,
    colorScheme: colorScheme);

ColorScheme colorScheme = ColorScheme.fromSwatch().copyWith(
  primary: Colors.brown.shade800,
  secondary: Colors.brown,
  background: Colors.brown.shade100,
  tertiary: Colors.white70,
);

TextTheme textTheme = const TextTheme(
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
        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white));
