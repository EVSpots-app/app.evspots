
import 'dart:async';
import 'package:flutter/material.dart';


/// in Main Page Change Routing Page
class ChangeRoutingPage extends ChangeNotifier {
  int currentIndex = 0;
  switchIndex(int i) {
    currentIndex = i;
    notifyListeners();
  }
}



/// in home Page Change Time of pitcher on Search container
class ChangeTime extends ChangeNotifier {
  bool time1 = true;

  switchTime() {
    Timer(const Duration(seconds: 5), () {
      time1 = false;
      notifyListeners();
    });
  }
}




