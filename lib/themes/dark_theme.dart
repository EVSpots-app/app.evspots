import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_color.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.bodyColorDark,
    iconTheme: IconThemeData(
      color: AppColor.bodyColor,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColor.bodyColorDark,
      statusBarIconBrightness:Brightness.light
      // For Android (dark icons)
      // statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
  ),
    fontFamily: 'Tajawal',
  brightness: Brightness.dark,
  backgroundColor: AppColor.bodyColorDark,
  scaffoldBackgroundColor: AppColor.bodyColorDark,
  hintColor: AppColor.textColor,
  primaryColorLight: AppColor.buttonBackgroundColorDark,
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.bold
    )
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: Colors.white
  ),
);
