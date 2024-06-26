import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_color.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.bodyColor,
    // titleTextStyle: TextStyle(color: AppColor.secColor),
    iconTheme: IconThemeData(
      color: AppColor.secColor,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.bodyColor,
        statusBarIconBrightness:Brightness.dark
      // For Android (dark icons)
      // statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
  ),
    fontFamily: 'Tajawal',
  brightness: Brightness.light,
  backgroundColor: AppColor.bodyColor,
  scaffoldBackgroundColor: AppColor.bodyColor,
  hintColor: AppColor.textColor,
  primaryColorLight: AppColor.buttonBackgroundColor,
  textTheme: const TextTheme(
    headline1: TextStyle(

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
