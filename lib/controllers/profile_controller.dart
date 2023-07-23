import 'package:flutter/material.dart';
import 'package:klimbb148/models/profile_model.dart';

class ProfileController extends ChangeNotifier {
  ProfileController() {
    getprofileModelList();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setisLoading(bool value) {
    _isLoading = value;
    debugPrint("isLoading: $_isLoading");
    notifyListeners();
  }

  double _lat = 0;
  double get lat => _lat;
  void setLat(double value) {
    _lat = value;
    notifyListeners();
  }

  double _lng = 0;
  double get lng => _lng;
  void setLng(double value) {
    _lng = value;
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
          lat: 0, lng: 0, name: "John Doe", fontSize: 12, color: "0xFF000000"));
      _profileModelList.add(ProfileModel(
          lat: 0, lng: 0, name: "Jane Doe", fontSize: 12, color: "0xFF000000"));
      _profileModelList.add(ProfileModel(
          lat: 0,
          lng: 0,
          name: "John Smith",
          fontSize: 12,
          color: "0xFF000000"));
      _profileModelList.add(ProfileModel(
          lat: 0,
          lng: 0,
          name: "Jane Smith",
          fontSize: 12,
          color: "0xFF000000"));
      _profileModelList.add(ProfileModel(
          lat: 0, lng: 0, name: "John Doe", fontSize: 12, color: "0xFF000000"));
      _profileModelList.add(ProfileModel(
          lat: 0, lng: 0, name: "Jane Doe", fontSize: 12, color: "0xFF000000"));
      _profileModelList.add(ProfileModel(
          lat: 0,
          lng: 0,
          name: "John Smith",
          fontSize: 12,
          color: "0xFF000000"));
      _profileModelList.add(ProfileModel(
          lat: 0,
          lng: 0,
          name: "Jane Smith",
          fontSize: 12,
          color: "0xFF000000"));

      notifyListeners();
      setisLoading(false);
    });
  }
}
