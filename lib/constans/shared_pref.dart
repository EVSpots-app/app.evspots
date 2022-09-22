import 'package:evspots/constans/shared_pref_keys.dart';
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

  deletePrefs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

}
