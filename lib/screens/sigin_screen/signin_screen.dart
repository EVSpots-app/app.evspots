import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evspots/screens/consumer/admin_role/admin_consumer.dart';
import 'package:evspots/screens/signup_screen/signup_screen.dart';
import 'package:evspots/screens/verify_screen/verify_screen.dart';
import 'package:evspots/themes/theme_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../../themes/app_color.dart';
import '../../widgets/Images/logo_evspots.dart';
import '../../widgets/custom_button.dart';

TextEditingController countryController = TextEditingController();
var phone = "";

class SignInScreen extends StatefulWidget {
  static String verify = "";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // void _callBackFunction(String name, String dialCode, String flag) {
  //   // place your code
  // }

  String _phoneErrorMsg = '';
  // bool checkUser = false;

  @override
  void initState() {
    // countryController.text = "+962";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: LogoEVSpots()),
        ),
        // drawer: MyDrawer(),
        body: Center(
          child: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/ev.jpeg'),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi Motasem,',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const Text(
                          'Sign in Now',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        const Text(
                          'Enter Phone Number ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(
                  //   height: height * 0.01,
                  // ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        IntlPhoneField(
                          decoration: InputDecoration(
                            errorText: _phoneErrorMsg,
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              color: themeNotifier.isDark
                                  ? AppColor.bodyColor
                                  : AppColor.secColor,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 2, color: Colors.grey.shade500)),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]+')),
                            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                          ],
                          onChanged: (value) {
                            phone = value.completeNumber;
                          },
                          // onChanged: (phone) {
                          //   print(phone.completeNumber);
                          // },
                          onCountryChanged: (country) {
                            phone = country.name;
                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        MyButton(
                          onTap: () async {
                            if (_isValid()) {
                              print(countryController.text + phone);

                              var user = FirebaseFirestore.instance
                                  .collection('users');
                              user.get().then((value) {
                                value.docs.forEach((element) async {
                                 var  checkUser = await element
                                      .data()
                                      .containsValue(
                                          countryController.text + phone);
                                  if (checkUser) {
                                    print("yes");
                                    await FirebaseAuth.instance
                                        .verifyPhoneNumber(
                                      phoneNumber:
                                          countryController.text + phone,
                                      verificationCompleted:
                                          (PhoneAuthCredential credential) {},
                                      verificationFailed:
                                          (FirebaseAuthException e) {
                                        print(e.toString());
                                      },
                                      codeSent: (String verificationId,
                                          int? resendToken) async {
                                        SignInScreen.verify = verificationId;

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   VerifyScreen()),
                                        );
                                        print(verificationId);
                                      },
                                      timeout: const Duration(seconds: 100),
                                      codeAutoRetrievalTimeout:
                                          (String verificationId) {
                                        print('time out');
                                      },
                                    );
                                  }
                                  // else if(!checkUser){
                                  //    CircularProgressIndicator();
                                  // }
                                  else {
                                    print("no");
                                     // CircularProgressIndicator();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpScreen()),
                                    );
                                  }
                                });
                              });
                            }
                          },
                          title: 'Send the code',
                        ),

                        // MyButton(
                        //   onTap: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) => SignUpScreen()));
                        //   },
                        //   title: 'Sign Up',
                        // ),
                        Consumer<AdminMode>(
                          builder: (_, consumer, __) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    consumer.changeIsAdmin(false);
                                  },
                                  child: Text(
                                    'Admin Role',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: consumer.isAdmin
                                            ? Colors.amber
                                            : Colors.transparent),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    consumer.changeIsAdmin(true);
                                  },
                                  child: Text(
                                    'User Role',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: consumer.isAdmin
                                            ? Colors.transparent
                                            : Colors.amber),
                                  ),
                                ),
                              ],
                            );
                          },
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
      _phoneErrorMsg = '';
    });
    if (phone.isEmpty) {
      setState(() {
        _phoneErrorMsg = 'Enter your number';
      });
      return false;
    }
    setState(() {
      _phoneErrorMsg = '';
    });
    return true;
  }
}
