import 'package:evspots/auth/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  static AppModel shared = AppModel(); // instance shared singleton

  Locale _appLocale = Locale('en'); //  datatype

  Locale get appLocale => _appLocale; // getter


  Future setInitialLanguageValue()async{
    bool x;
    x = await SharedPreference().getLanguage();
    _appLocale = x ? Locale('en') : Locale('ar');
  }

  // void changeLanguage(String language) {
  //   // ar
  //   // ar  ''
  //   if (_appLocale.languageCode.contains('en')) {
  //     _appLocale = Locale('ar');
  //   } else
  //     _appLocale = Locale('en');
  //
  //   notifyListeners();
  // }

  bool isArabic() {
    return _appLocale.languageCode.contains('ar');
  }

  void changeLanguageToEn(String language) {
    // ar
    // ar  '
    _appLocale = Locale('en');

    notifyListeners();
  }

  void changeLanguageToAr(String language) {
    // ar
    // ar  '
    _appLocale = Locale('ar');

    notifyListeners();
  }
}
