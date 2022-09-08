import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  static AppModel shared = AppModel(); // instance shared singelton
  Locale _appLocale = Locale('en'); //  datatype

  Locale get appLocale => _appLocale; // getter

  void changeLanguage(String language) { // ar
    // ar  ''
  if(_appLocale.languageCode.contains('en')){
    _appLocale=Locale('ar');
  }
  else
    _appLocale=Locale('en');

    notifyListeners();

  }
  bool isArabic(){
    return _appLocale.languageCode.contains('ar');
  }

}