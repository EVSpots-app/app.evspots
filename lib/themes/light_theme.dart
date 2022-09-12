import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: 'Tajawal',
  brightness: Brightness.light,
  backgroundColor: AppColor.bodyColor,
  scaffoldBackgroundColor: AppColor.bodyColor,
  hintColor: AppColor.textColor,
  primaryColorLight: AppColor.buttonBackgroundColor,
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontFamily: 'Pacifico',
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.bold
    )
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: Colors.black
  )
);
