class MyUser {
  String phone;
  String? fullName;
  String email;
  // String? id;

  MyUser({required this.email, required this.phone});

  factory MyUser.fromJson(Map<String, dynamic> json) {
    MyUser user = MyUser(
      email: json["email"] ?? '',
      phone: json["phone"] ?? '',
    );
    if (json['fullName'] != null) {
      user.fullName = json['fullName'];
    }
    return user;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}


class MyUser2 {
  String phone;
  String firstName;
  String lastName;
  String email;
  String birthDate;
  String? gender;

  MyUser2({required this.email, required this.phone,required this.firstName,required this.lastName,required this.birthDate});

  factory MyUser2.fromJson(Map<String, dynamic> json) {
    MyUser2 user = MyUser2(
      email: json["email"] ?? '',
      phone: json["phone"] ?? '',
      firstName: json["firstName"] ?? '',
      lastName: json["lastName"] ?? '',
      birthDate: json["birthDate"] ?? '',

    );
    if (json['gender'] != null) {
      user.gender = json['gender'];
    }
    return user;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['birthDate'] = birthDate;
    data['gender'] = gender;
    return data;
  }
}
