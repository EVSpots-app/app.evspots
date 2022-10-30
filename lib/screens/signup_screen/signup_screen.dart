import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evspots/screens/verify_screen/verify_screen.dart';
import 'package:evspots/widgets/CustomButton/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../auth/shared_pref.dart';
import '../../generated/l10n.dart';
import '../../widgets/AppBar/AppBar.dart';
import '../../widgets/Drawer/launch_in_browser.dart';
import '../main_page.dart';
import '../sigin_screen/signin_screen.dart';
import 'model/user_data_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void _callBackFunction(String name, String dialCode, String flag) {
    // place your code
  }

  TextEditingController _phone = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();

  String _emailErrorMsg = '';
  String _phoneErrorMsg = '';

  // String _fullNameErrorMsg = '';

  Future<void>? _launched;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    isLogin = true;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // FirebaseAuth.instance.currentUser?.phoneNumber;
    final Uri toLaunch = Uri(
        scheme: 'https', host: 'en.wikipedia.org', path: 'wiki/Private_police');
    var code = "";
    return Scaffold(
      // backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(
        title: S.of(context).evspots,
      ),
      // drawer: MyDrawer(),
      bottomNavigationBar: Container(
        height: height * 0.08,
        child: Column(children: [
          Text(
            "By Continue you're agreed to our",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: height * 0.005),
          InkWell(
            child: Text(
              "Terms & Condition",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              _launched = LaunchInBrowser(toLaunch);
            },
          ),
        ]),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Text(
                    'Sign up Now',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text(
                    'Looks like you are not registered yet ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  const Text(
                    'Phone Number ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: IntlPhoneField(
                      controller: _phone,
                      decoration: InputDecoration(
                          errorText: _phoneErrorMsg,
                          labelText: 'Phone Number',
                          // labelStyle: TextStyle(
                          //   color: themeNotifier.isDark
                          //       ? AppColor.bodyColor
                          //       : AppColor.secColor,
                          // ),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  width: 2, color: Colors.grey.shade500))),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+')),
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
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: TextField(
                      controller: _firstName,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  width: 2, color: Colors.grey.shade500))),
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
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: TextField(
                      controller: _lastName,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  width: 2, color: Colors.grey.shade500))),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  const Text(
                    'Email Address ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          errorText: _emailErrorMsg,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  width: 2, color: Colors.grey.shade500))),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  MyButton(
                    onTap: () async {
                      if (_isValid()) {
                        try {
                          // MyUser2 user2 =MyUser2(email: email, phone: phone, firstName: firstName, lastName: lastName, birthDate: birthDate)
                          MyUser user = MyUser(
                              email: _email.text,
                              phone: countryController.text + phone, firstName:_firstName.text );
                          if (_lastName.text.isNotEmpty)
                            user.lastName = _lastName.text;
                          var collection =
                              FirebaseFirestore.instance.collection('users');
                          collection.add(user.toJson());

                          SharedPreference().setLoggedin();
                          SharedPreference().setUserData(user);
                          Navigator.pushAndRemoveUntil<void>(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const MainPage()),
                            ModalRoute.withName('/'),
                          );
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                    },
                    title: 'Continue',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _isValid() {
    setState(() {
      _phoneErrorMsg = '';
      _emailErrorMsg = '';
    });
    if (_email.text.isEmpty) {
      setState(() {
        _emailErrorMsg = 'Email is required';
      });
      return false;
    }
    // if (!_email.text.isEmail()) {
    //   setState(() {
    //     _emailErrorMsg = 'Email is badly format';
    //   });
    //   return false;
    // }
    if (_phone.text.isEmpty) {
      setState(() {
        _phoneErrorMsg = 'phone is required';
      });
      return false;
    }

    setState(() {
      _phoneErrorMsg = '';
      _emailErrorMsg = '';
    });
    return true;
  }
}
