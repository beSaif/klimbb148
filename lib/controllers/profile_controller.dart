import 'package:flutter/material.dart';
import 'package:klimbb148/models/profile_model.dart';
import 'package:klimbb148/services/isar_db.dart';

class ProfileController extends ChangeNotifier {
  ProfileController() {
    // getprofileModelList();
  }

  String _errorText = "";
  String get errorText => _errorText;
  void setErrorText(String value) {
    _errorText = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setisLoading(bool value) {
    _isLoading = value;
    debugPrint("isLoading: $_isLoading");
    notifyListeners();
  }

  TextEditingController latController = TextEditingController(
    text: "0",
  );
  TextEditingController lngController = TextEditingController(
    text: "0",
  );
  TextEditingController fontSizeController = TextEditingController(
    text: "12",
  );

  String _selectedColor = "0xFFF44336";
  String get selectedColor => _selectedColor;
  void setSelectedColor(String value) {
    _selectedColor = value;
    notifyListeners();
  }

  bool checkProfileValidity() {
    if (double.parse(latController.text) > 90 ||
        double.parse(latController.text) < -90) {
      setErrorText("Latitude must be between -90 and 90");
      return false;
    }
    if (double.parse(lngController.text) > 180 ||
        double.parse(lngController.text) < -180) {
      setErrorText("Longitude must be between -180 and 180");
      return false;
    }
    if (int.parse(fontSizeController.text) > 32 ||
        int.parse(fontSizeController.text) < 1) {
      setErrorText("Font size must be between 1 and 32");
      return false;
    }
    setErrorText("");
    return true;
  }

  Future createProfile() async {
    debugPrint("Creating profile...");
    setisLoading(true);

    ProfileModel newProfile = ProfileModel(
        lat: double.parse(latController.text),
        lng: double.parse(lngController.text),
        fontSize: int.parse(fontSizeController.text),
        color: _selectedColor);

    debugPrint("newProfile: $newProfile");
    await IsarService().saveProfiles(newProfile);
    notifyListeners();
    setisLoading(false);
  }

  void resetCreateProfile() {
    debugPrint("Resetting create profile...");
    latController.text = "0";
    lngController.text = "0";
    fontSizeController.text = "12";
    _selectedColor = "0xFFF44336";
    notifyListeners();
  }
}
