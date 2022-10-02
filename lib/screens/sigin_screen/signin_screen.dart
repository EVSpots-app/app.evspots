import 'package:evspots/screens/signup_screen/signup_screen.dart';
import 'package:evspots/screens/verify_screen/verify_screen.dart';
import 'package:evspots/themes/theme_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../themes/app_color.dart';

import '../../widgets/AppBar.dart';

class SignInScreen extends StatefulWidget {
  static String verify = "";


  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  void _callBackFunction(String name, String dialCode, String flag) {
    // place your code
  }

  TextEditingController countryController = TextEditingController();
  String _emailErrorMsg = '';
  var _phone = "";


  @override
  void initState() {
    // countryController.text = "+962";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        // backgroundColor: Colors.white,
        appBar: MyAppBar(),
        // drawer: MyDrawer(),
        body: Center(
          child: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/ev.jpeg'),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  const Text(
                    'Sign in Now',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Text(
                    'Please Change your countryCode ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        IntlPhoneField(

                          decoration: InputDecoration(
                            errorText: _emailErrorMsg,
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              color: themeNotifier.isDark
                                  ? AppColor.bodyColor
                                  : AppColor.secColor,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          onChanged: (value) {
                            _phone = value.completeNumber;
                          },
                          // onChanged: (phone) {
                          //   print(phone.completeNumber);
                          // },
                          onCountryChanged: (country) {
                            _phone = country.name;
                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),

                        GestureDetector(
                          onTap: ()
                          async {
                            if (_isValid()){
                              print(countryController.text + _phone);
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: countryController.text + _phone,
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed: (FirebaseAuthException e) {
                                  print(e.toString());
                                },
                                codeSent:
                                    (String verificationId, int? resendToken) async{
                                  SignInScreen.verify = verificationId;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const VerifyScreen()),
                                  );
                                  print(verificationId);
                                },
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {
                                  print('time out');
                                },
                              );
                            }

                          },
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
                              'Send the code',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
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
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        // FloatingActionButton(
                        //     child: const Icon(Icons.arrow_back_ios),
                        //     backgroundColor: AppColor.buttonBackgroundColor,
                        //     onPressed: (){Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) =>  SignUpScreen()));}),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
  bool _isValid() {
    setState(() {
      _emailErrorMsg = '';
    });
    if (_phone.isEmpty) {
      setState(() {
        _emailErrorMsg = 'Enter your number' ;
      });
      return false;
    }
    setState(() {
      _emailErrorMsg = '';
    });
    return true;
  }
}


