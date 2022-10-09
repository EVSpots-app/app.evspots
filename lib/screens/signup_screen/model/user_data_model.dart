class MyUser {
  String email;
  String? fullName;
  String? id;
  String phone;

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
