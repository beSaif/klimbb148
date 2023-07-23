import 'package:isar/isar.dart';

part 'profile_model.g.dart';

@collection
class ProfileModel {
  Id id = Isar.autoIncrement;
  double? lat;
  double? lng;
  int? fontSize;
  String? color;

  ProfileModel({this.lat, this.lng, this.fontSize, this.color});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    fontSize = json['fontSize'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    data['fontSize'] = fontSize;
    data['color'] = color;
    return data;
  }

  @override
  String toString() {
    return 'ProfileModel{lat: $lat, lng: $lng, fontSize: $fontSize, color: $color}';
  }
}
