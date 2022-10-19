import 'package:evspots/auth/shared_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPrefKeys.isData, true);
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(SharedPrefKeys.isData) ?? false;
  }

  setLanguage({required bool isEnglish}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPrefKeys.isEnglish, isEnglish);
  }

  getLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(SharedPrefKeys.isEnglish);
  }

  deletePrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

}
