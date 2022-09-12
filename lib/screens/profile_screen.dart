import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:evspots/screens/home_screen.dart';
import 'package:evspots/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../themes/app_color.dart';
import '../widgets/AppBar.dart';
import 'otp_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Profile',
                        style: TextStyle(fontSize: 28,),
                      ),
                      SizedBox(
                        width: width*0.3,
                        height:height*0.2,
                        child: Stack(
                          children: [
                          SizedBox(
                            width: width*0.25,
                            height: height*0.15,
                            child:const CircleAvatar(
                              backgroundImage: AssetImage('assets/images/pic1.jpg'),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.1,
                            right: MediaQuery.of(context).size.width * 0.03,
                            child: SizedBox(
                              width: width*0.1,
                              height: height*0.05,
                              child: FloatingActionButton(
                                child: const Icon(Icons.camera_alt,),
                                backgroundColor: AppColor.buttonBackgroundColor,
                                // backgroundColor: const Color(0xFFF65F5B),
                                onPressed: () {
                                  showAdaptiveActionSheet(
                                    context: context,
                                    // title: const Text('Title'),
                                    androidBorderRadius: 30,
                                    actions: <BottomSheetAction>[
                                      BottomSheetAction(
                                          title: const Text('Camera'),
                                      onPressed: (_){}),
                                      BottomSheetAction(
                                          title: const Text('Gallery'),
                                          onPressed: (_) {}),
                                    ],
                                    cancelAction: CancelAction(
                                        title: const Text(
                                            'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
                                  );
                                },
                              ),
                            ),
                          ),
                        ],),
                      )

                  ],
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
                    height: height*0.1,
                  ),
                  GestureDetector(
                    onTap: (){},
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
                        'Update',
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


