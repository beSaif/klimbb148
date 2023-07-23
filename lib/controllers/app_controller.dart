import 'package:flutter/material.dart';
import 'package:klimbb148/models/profile_model.dart';
import 'package:klimbb148/services/isar_db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends ChangeNotifier {
  AppController() {
    checkIsFirstLaunch().then((value) {
      setisFirstLaunch(value);
      setisLoading(false);
    });
    getSelectedIndexIdSharedPref().then((value) {
      getSelectedIndexProfileData();
    });
  }

  int _selectedIndexId = 0;
  int get selectedIndexId => _selectedIndexId;
  void setSelectedIndexId(int value) {
    _selectedIndexId = value;
    ("dbg selectedIndexId: $value");
    notifyListeners();
  }

  void setSelectedIndexIdSharedPref(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('selectedIndexId', value);
    notifyListeners();
  }

  Future getSelectedIndexIdSharedPref() async {
    setisLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? selectedIndexId = prefs.getInt('selectedIndexId');
    if (selectedIndexId != null) {
      updateSelectedIndex(selectedIndexId);
      notifyListeners();
    }
    setisLoading(false);
  }

  void getSelectedIndexProfileData() async {
    await IsarService().getProfile(_selectedIndexId).then((value) {
      if (value != null) {
        setSelectedProfileModel(value);
        changeColorSchemePrimary(Color(int.parse(value.color!)));
      }
    });
  }

  void updateSelectedIndex(int index) {
    setSelectedIndexId(index);
    setSelectedIndexIdSharedPref(index);
    getSelectedIndexProfileData();
    changeColorSchemePrimary(Color(int.parse(selectedProfileModel.color!)));
    notifyListeners();
  }

  ProfileModel _selectedProfileModel = ProfileModel(
    lat: 0,
    lng: 0,
    fontSize: 12,
    color: "0xFF4E342E",
  );
  ProfileModel get selectedProfileModel => _selectedProfileModel;
  void setSelectedProfileModel(ProfileModel value) {
    _selectedProfileModel = value;
    notifyListeners();
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

  void changeColorSchemePrimary(Color value) {
    _themeData = _themeData.copyWith(
        colorScheme: _themeData.colorScheme.copyWith(primary: value));
    notifyListeners();
  }

  void addDefaultProfile() {
    IsarService().saveProfiles(
        ProfileModel(lat: 0, lng: 0, fontSize: 12, color: "0xFF4E342E"));
  }
}

ThemeData defaultThemeData = ThemeData(
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: textTheme,
);

ColorScheme colorScheme = ColorScheme.fromSwatch().copyWith(
  primary: const Color.fromRGBO(78, 52, 46, 1),
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
