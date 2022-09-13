import 'package:evspots/screens/home_screen.dart';
import 'package:evspots/screens/home_screen2.dart';
import 'package:evspots/screens/signup_screen.dart';
import 'package:evspots/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../themes/app_color.dart';
import '../widgets/AppBar.dart';
import 'otp_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  void _callBackFunction(String name, String dialCode, String flag) {
    // place your code
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: MyAppBar(),
      // drawer: MyDrawer(),
      body: Center(
        child: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/ev.jpeg'),
                 SizedBox(
                  height: height*0.03,
                ),
                const Text(
                  'Sign in Now',
                  style: TextStyle(fontSize: 28,),
                ),
                 SizedBox(
                  height: height*0.02,
                ),
                const Text(
                  'Please Change your countrycode ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,

                  ),
                ),
                 SizedBox(
                  height: height*0.04,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [


                      IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
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

                       SizedBox(
                        height: height*0.02,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  HomeScreen2()),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: height*0.07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColor.buttonBackgroundColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Continue',
                            style: TextStyle( fontSize: 16.0),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  SignUpScreen()));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: height*0.07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColor.buttonBackgroundColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Sign Up',
                            style: TextStyle( fontSize: 16.0),
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
  }
}
