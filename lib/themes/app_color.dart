import 'package:flutter/material.dart';

class AppColor {

  // Font colors
  static Color textColor = const Color(0xff131313);
  static Color hintColor =  Colors.grey;
  static Color textColorDark = const Color(0xffffffff);

  // App
  static Color mainColor= const Color (0xffFFFB5E);
  static Color secColor= const Color (0xff000000);

  static Color bodyColor = const Color(0xffffffff);
  static Color bodyColorDark = const Color(0xb82a2a2a);

  static Color buttonBackgroundColor = const Color(0xff1fd57e);
  static Color buttonBackgroundColorDark = const Color(0xff1fd57e);
}

class AppFont {

  static TextStyle bold =  TextStyle(fontFamily: 'Tajawal-Black',color: AppColor.textColor);
  static TextStyle boldDark =  TextStyle(fontFamily: 'Tajawal-Black',color: AppColor.textColorDark);

}