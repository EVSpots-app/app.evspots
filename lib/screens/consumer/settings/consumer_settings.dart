import 'package:evspots/auth/shared_pref.dart';
import 'package:flutter/material.dart';

/// in Vehicles page & Settings page => Change Language and Theme model
class ChangeDropdownValue extends ChangeNotifier {
  String dropdownValue = 'Bmw';
  String dropdownValue2 = 'Km (Kilometer)';
  static const String dropdownValueEN = 'English';
  static const String dropdownValueAR = 'عربي';
  String dropdownValue4 = 'Dark Mode';

  switchDropdownValue(String? newValue) {
    dropdownValue = newValue!;
    notifyListeners();
  }
  switchDropdownValue2(String? newValue1) {
    dropdownValue2 = newValue1!;
    notifyListeners();
  }
  ///App Settings Change Language
  String? initialLanguageValue;
  static const List<String> languages = [
    dropdownValueEN,
    dropdownValueAR
  ];
  switchDropdownLanguage({required String language}) async{

    if(language == dropdownValueEN){
      await SharedPreference().setLanguage(isEnglish: true);

    }else{
      language == dropdownValueAR;
      await SharedPreference().setLanguage(isEnglish: false);
    }
    initialLanguageValue =  language;
    notifyListeners();
  }
  switchDropdownValue4(String? newValue3) async{
    dropdownValue4 = newValue3!;
    // await SharedPreference().getTheme();
    notifyListeners();
  }

  Future<void> setInitialLanguageValue()async{
    bool x;
    x = await SharedPreference().getLanguage();
    initialLanguageValue = x ? dropdownValueEN : dropdownValueAR;
  }
}