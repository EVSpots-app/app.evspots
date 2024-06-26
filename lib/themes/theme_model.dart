import 'package:evspots/auth/shared_pref.dart';
import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late SharedPreference _preferences;
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _preferences = SharedPreference();
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}
