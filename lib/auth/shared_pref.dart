import 'dart:convert';

import 'package:evspots/auth/shared_pref_keys.dart';
import 'package:evspots/screens/signup_screen/model/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/consumer/user_info_consumer/user_info_consumer.dart';

class SharedPreference {

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(SharedPrefKeys.isDarkMode, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(SharedPrefKeys.isDarkMode) ?? false;
  }

  setLoggedin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPrefKeys.isLoggedIn, true);
  }

  getLoggedin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(SharedPrefKeys.isLoggedIn) ?? false;
  }

  /* -- User Data  -- */
  setUserData(MyUser user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = {
      "fname":user.firstName,
      "lname":user.lastName,
      "email":user.email,
      "phone":user.phone,

    };
    String x = jsonEncode(data);
    prefs.setString(SharedPrefKeys.userData, x);
  }

  getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(SharedPrefKeys.userData) ?? '';
  }

  // setDocId(String id) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(SharedPrefKeys.docID,id);
  // }
  //
  // getDocId() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.getString(SharedPrefKeys.docID) ?? '';
  // }

  setLanguage({required bool isEnglish}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPrefKeys.isEnglish, isEnglish);
  }

  getLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(SharedPrefKeys.isEnglish) ?? true;
  }

  deletePrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

}
