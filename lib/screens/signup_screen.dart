import 'package:evspots/screens/home_screen.dart';
import 'package:evspots/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../themes/app_color.dart';
import '../widgets/AppBar.dart';
import 'otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height*0.02,
                  ),
                  const Text(
                    'Sign up Now',
                    style: TextStyle(fontSize: 28,),
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  const Text(
                    'Looks like you are not registered yet ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: height*0.06,
                  ),
                  const Text(
                    'Phone Number ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  TextField(
                    keyboardType:TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: height*0.04,
                  ),
                  const Text(
                    'Full Name ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: height*0.04,
                  ),
                  const Text(
                    'Email Address ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  TextField(
                    keyboardType:TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(
                    height: height*0.04,
                  ),
                  GestureDetector(
                    onTap: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  HomeScreen()),
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
                        style: TextStyle( fontSize: 16.0,color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
