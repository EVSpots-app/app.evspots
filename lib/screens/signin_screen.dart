import 'package:evspots/screens/home_screen.dart';
import 'package:evspots/widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/AppBar.dart';
import '../widgets/country_picker.dart';
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
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/ev.jpeg'),
                const SizedBox(
                  height: 16,
                ),
                // Image.asset('assets/images/registration.png'),
                // const SizedBox(
                //   height: 16,
                // ),
                const Text(
                  'Sign in Now',
                  style: TextStyle(fontSize: 28,),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Please Change your countrycode ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,

                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(20.0),
                  // decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     // ignore: prefer_const_literals_to_create_immutables
                  //     boxShadow: [
                  //       const BoxShadow(
                  //         color: Colors.grey,
                  //         offset: Offset(0.0, 1.0), //(x,y)
                  //         blurRadius: 6.0,
                  //       ),
                  //     ],
                  //     borderRadius: BorderRadius.circular(16.0)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0
                        ),
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(
                              width :100,
                              child: CountryPicker(
                                callBackFunction: _callBackFunction,
                                headerText: 'Select Country',
                                headerBackgroundColor: Theme.of(context).primaryColor,
                                headerTextColor: Colors.white,
                              ),
                            ),
                            const Expanded(
                              child:  TextField(
                                decoration: InputDecoration(
                                  hintText: 'Contact Number',
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding:  EdgeInsets.symmetric(vertical: 13.0),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
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
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(36),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Validate Mobile Number',
                            style: TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                      ),
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
