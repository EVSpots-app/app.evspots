class InfoMap {
  String name;
  String lat;
  String lng;



  InfoMap({required this.name, required this.lat,required this.lng,});

  factory InfoMap.fromJson(Map<String, dynamic> json) {
    InfoMap user = InfoMap(
      name: json["name"] ?? '',
      lat: json["lat"] ?? '',
      lng: json["lng"] ?? '',
    );

    return user;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}