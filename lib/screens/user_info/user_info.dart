import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evspots/screens/consumer/user_info_consumer/user_info_consumer.dart';
import 'package:evspots/screens/signup_screen/model/user_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../themes/app_color.dart';
import '../../themes/theme_model.dart';
import '../../widgets/custom_button.dart';
import '../sigin_screen/signin_screen.dart';
import '../verify_screen/verify_screen.dart';

// ignore: must_be_immutable
class UserInfoScreen extends StatefulWidget {
  // final id;
  UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
   TextEditingController _phone = TextEditingController();
  TextEditingController _email= TextEditingController();
  TextEditingController _fullName= TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
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
          ),
          body: Consumer<UserInfoConsumer>(
            builder: (_, consumer, __) {
              return FutureBuilder(
                future: consumer.getData(),
                builder: ((context, snapshot) {

                 // _phone = TextEditingController(text: user.phone);
                 // _fullName = TextEditingController(/*text: user.fullName*/);
                 // _email = TextEditingController(text: user.email);

                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    print('${snapshot.error}');
                  } else  {
                    MyUser user = snapshot.data!;
                    // _phone.addListener(() {
                    //     _phone.text = user.phone;
                    // });
                    // _email.addListener(() {
                    //   _email.text = user.email;
                    // });
                    // _fullName.addListener(() {
                    //   setState(() {
                    //     _fullName.text = user.fullName;
                    //   });
                    // });
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Check you data ...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          const Text(
                            'Full Name ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          // SizedBox(
                          //   height: height * 0.02,
                          // ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller:_fullName,
                              // onChanged: (value){
                              //    setState(() {
                              //      user.fullName = value;
                              //    });
                              // },
                              decoration: InputDecoration(
                               hintText: user.fullName,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                      BorderSide(width: 2, color: Colors.grey.shade500))),
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
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _phone,
                              // onChanged: (value){
                              //   setState(() {
                              //     user.phone = value;
                              //   });
                              // },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                 hintText: user.phone,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                      BorderSide(width: 2, color: Colors.grey.shade500))),
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
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                            controller: _email,
                            //   onChanged: (value){
                            //     setState(() {
                            //       user.email = value;
                            //     });
                            //   },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                               hintText: user.email,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                      BorderSide(width: 2, color: Colors.grey.shade500))),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
              );
            },
          ),
          bottomNavigationBar: MyButton(
            onTap: () async {
              try {

                // MyUser user = MyUser(
                //     email: _email.text,
                //     phone: countryController.text + phone);
                // if (_fullName.text.isNotEmpty)
                //   user.fullName = _fullName.text;
                // var collection =
                // FirebaseFirestore.instance.collection('users');
                // collection.doc(widget.id).update(user.toJson());
                // collection.add(user.toJson());

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
              } catch (e) {
                print(e.toString());
              }
            },
            title: 'Update',
          ));
    });
  }
}

// class UserInfoWidget extends StatelessWidget {
//   const UserInfoWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       padding:
//           const EdgeInsets.only(left: 20.0, right: 20.0, top: 15, bottom: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 S.of(context).profile,
//                 style: TextStyle(
//                     fontSize: 40,
//                     // color: themeNotifier.isDark
//                     //     ? AppColor.bodyColor
//                     //     : AppColor.secColor,
//                     fontFamily: 'Tajawal-Black'),
//               ),
//               MyPicture(),
//             ],
//           ),
//           SizedBox(
//             height: height * 0.04,
//           ),
//           const Text(
//             'Full Name ',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 18,
//             ),
//           ),
//           // SizedBox(
//           //   height: height * 0.02,
//           // ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide:
//                           BorderSide(width: 2, color: Colors.grey.shade500))),
//             ),
//           ),
//
//           SizedBox(
//             height: height * 0.04,
//           ),
//           const Text(
//             'Phone Number ',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 18,
//             ),
//           ),
//           // SizedBox(
//           //   height: height * 0.02,
//           // ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextField(
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide:
//                           BorderSide(width: 2, color: Colors.grey.shade500))),
//             ),
//           ),
//           SizedBox(
//             height: height * 0.02,
//           ),
//           const Text(
//             'Email Address ',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 18,
//             ),
//           ),
//           // SizedBox(
//           //   height: height * 0.02,
//           // ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextField(
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide:
//                           BorderSide(width: 2, color: Colors.grey.shade500))),
//             ),
//           ),
//           SizedBox(
//             height: height * 0.02,
//           ),
//         ],
//       ),
//     );
//   }
// }
