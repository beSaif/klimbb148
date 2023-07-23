class ProfileModel {
  double? lat;
  double? lng;
  String? name;
  int? fontSize;
  String? color;

  ProfileModel({this.lat, this.lng, this.name, this.fontSize, this.color});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    fontSize = json['fontSize'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    data['name'] = name;
    data['fontSize'] = fontSize;
    data['color'] = color;
    return data;
  }

  @override
  String toString() {
    return 'ProfileModel{lat: $lat, lng: $lng, name: $name, fontSize: $fontSize, color: $color}';
  }
}
