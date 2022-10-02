import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

Widget getWidget(bool showOtherGender, bool alignVertical) {
  return GenderPickerWithImage(
    showOtherGender: showOtherGender,
    verticalAlignedText: alignVertical,

    // to show what's selected on app opens, but by default it's Male
    selectedGender: Gender.Male,
    selectedGenderTextStyle: TextStyle(
        color: Color(0xFF8b32a8), fontWeight: FontWeight.bold,fontSize: 20),
    unSelectedGenderTextStyle: TextStyle(
      color: Colors.black, fontWeight: FontWeight.normal,),
    onChanged: (Gender? gender) {
      print(gender);
    },
    //Alignment between icons
    equallyAligned: true,
    animationDuration: Duration(milliseconds: 300),
    isCircular: true,
    // default : true,
    opacityOfGradient: 0.4,
    padding: const EdgeInsets.all(3),
    size: 50, //default : 40
  );
}
