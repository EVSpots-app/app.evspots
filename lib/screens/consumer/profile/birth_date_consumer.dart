import 'package:flutter/material.dart';

class BirthDate extends ChangeNotifier {
  bool isDateSelected= false;
  DateTime? birthDate; // instance of DateTime
  String? birthDateInString ='MM/DD/YYYY';


  ChangeBirthDate(DateTime b) {
    isDateSelected=true;
    birthDateInString = "${birthDate!.month}/${birthDate!.day}/${birthDate!.year}";
    notifyListeners();
  }
}