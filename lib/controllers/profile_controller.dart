import 'package:flutter/material.dart';
import 'package:klimbb148/models/profile_model.dart';
import 'package:klimbb148/services/isar_db.dart';

class ProfileController extends ChangeNotifier {
  ProfileController() {
    // getprofileModelList();
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
