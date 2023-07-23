import 'package:flutter/material.dart';
import 'package:klimbb148/models/profile_model.dart';

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

  List<ProfileModel> _profileModelList = [];
  List<ProfileModel> get profileModelList => _profileModelList;
  void setprofileModelList(List<ProfileModel> value) {
    _profileModelList = value;
    notifyListeners();
  }

  void addProfileController(ProfileModel profileController) {
    _profileModelList.add(profileController);
    notifyListeners();
  }

  void getprofileModelList() async {
    debugPrint("Fetching from local storage...");
    setisLoading(true);
    // add some dummy data to profileModelList after 3 seconds to simulate a network call
    Future.delayed(const Duration(seconds: 1), () {
      _profileModelList.add(ProfileModel(
          lat: 210,
          lng: 310,
          name: "John Doe",
          fontSize: 12,
          color: "0xFFFF0000"));
      _profileModelList.add(ProfileModel(
          lat: 0,
          lng: 18,
          name: "Jane Doe",
          fontSize: 12,
          color: "0xFF00FF00"));
      _profileModelList.add(ProfileModel(
          lat: 20,
          lng: 30,
          name: "John Smith",
          fontSize: 24,
          color: "0xFF0000FF"));

      notifyListeners();
      setisLoading(false);
    });
  }

  Future createProfile() async {
    debugPrint("Creating profile...");
    setisLoading(true);

    ProfileModel newProfile = ProfileModel(
        lat: double.parse(latController.text),
        lng: double.parse(lngController.text),
        name: "John Doe",
        fontSize: int.parse(fontSizeController.text),
        color: _selectedColor);

    debugPrint("newProfile: $newProfile");

    _profileModelList.add(newProfile);
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
