

class myFavorite {
  String image;
  String titleText;
  String locationText;
  String numConnections;


  myFavorite({required this.image, required this.titleText,required this.locationText,required this.numConnections});

  factory myFavorite.fromJson(Map<String, dynamic> json) {
    myFavorite user = myFavorite(
      image: json["image"] ?? '',
      titleText: json["titleText"] ?? '',
      locationText: json["locationText"] ?? '',
      numConnections: json["numConnections"] ?? '',
    );

    return user;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['titleText'] = titleText;
    data['locationText'] = locationText;
    data['numConnections'] = numConnections;
    return data;
  }
}