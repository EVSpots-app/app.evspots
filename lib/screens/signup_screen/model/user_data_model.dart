import '../../../auth/shared_pref.dart';

class MyUser {
  String phone;
  String? lastName;
  String firstName;
  String email;

  MyUser({required this.email, required this.phone, required this.firstName});

  factory MyUser.fromJson(Map<String, dynamic> json) {
    MyUser user = MyUser(
      email: json["email"] ?? '',
      phone: json["phone"] ?? '',
      firstName: json["firstName"] ?? '',
    );
    if (json['lastName'] != null) {
      user.lastName = json['lastName'];
    }
    return user;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lastName'] = lastName;
    data['firstName'] = firstName;
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

  MyUser2(
      {required this.email,
      required this.phone,
      required this.firstName,
      required this.lastName,
      required this.birthDate});

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
