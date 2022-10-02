import 'dart:io';
import 'package:evspots/generated/l10n.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:evspots/themes/theme_model.dart';
import 'package:evspots/widgets/Gender.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../widgets/Picture/ProfilePicture.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _callBackFunction(String name, String dialCode, String flag) {
    // place your code
  }

  TextEditingController myBirthDate = TextEditingController();

  String initValue="Select your Birth Date";
  bool isDateSelected= false;
  DateTime? birthDate; // instance of DateTime
  String? birthDateInString ='Write your birth date';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        // backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color:
                themeNotifier.isDark ? AppColor.bodyColor : AppColor.secColor,
          ),
          backgroundColor: Colors.transparent,
          // backgroundColor: themeNotifier.isDark
          //     ? AppColor.bodyColorDark
          //     : AppColor.bodyColor,
          // title: Text(
          //   S.of(context).profile,
          //   style: TextStyle(
          //       color: themeNotifier.isDark
          //           ? AppColor.bodyColor
          //           : AppColor.secColor,
          //       fontFamily: 'Tajawal-Black'),
          // ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).profile,
                    style: TextStyle(
                      fontSize: 40,
                        color: themeNotifier.isDark
                            ? AppColor.bodyColor
                            : AppColor.secColor,
                        fontFamily: 'Tajawal-Black'),
                  ),
                  ProfilePicture(),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                'First Name ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
               Padding(
                padding:  EdgeInsets.all(8.0),
                child:  TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                'Last Name ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child:  TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                'Phone Number ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'Email Address ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child:  TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'Birth Date ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  side:  BorderSide(color: Colors.grey.shade400, width: 1.5),
                ),
                title: Text("${birthDateInString}",style: TextStyle(fontSize: 20,),),
                trailing: Icon(Icons.calendar_today),
                  onTap: ()async{
                    final datePick= await showDatePicker(
                        context: context,
                        initialDate: new DateTime.now(),
                        firstDate: new DateTime(1900),
                        lastDate: new DateTime(2100)
                    );
                    if(datePick!=null && datePick!=birthDate){
                      setState(() {
                        birthDate=datePick;
                        isDateSelected=true;
                        birthDateInString = "${birthDate!.month}/${birthDate!.day}/${birthDate!.year}";
                      });
                    }
                  }
              ),
            ),
          ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(child: Text('Gender*',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
               getWidget(true, true),

            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(8),
            height: height * 0.07,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.mainColor,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Update',
              style: TextStyle(fontSize: 18.0, color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    });
  }
}









