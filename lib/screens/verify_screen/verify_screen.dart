import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evspots/screens/sigin_screen/signin_screen.dart';
import 'package:evspots/widgets/AppBar/AppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../generated/l10n.dart';
import '../../widgets/CustomButton/custom_button.dart';
import '../signup_screen/signup_screen.dart';
import '../user_info/user_info.dart';

bool isLogin = false;

// ignore: must_be_immutable
class VerifyScreen extends StatelessWidget {
   VerifyScreen({Key? key}) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;

   bool checkUser = false ;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code = "";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        title: S.of(context).evspots,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   'assets/img1.png',
              //   width: 150,
              //   height: 150,
              // ),
              // const SizedBox(
              //   height: 25,
              // ),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                onChanged: (value) {
                  code = value;
                },
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                onTap: () async {

                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: SignInScreen.verify, smsCode: code);

                   await auth.signInWithCredential(credential);

                    // Check user in FireStore.
                    var user = FirebaseFirestore.instance
                        .collection('users');
                    user.get().then((value)  {
                      for ( var object in value.docs) {
                        print(object.data());

                        if(object.data().containsValue(
                            countryController.text + phone))
                       {

                          // value.docs.where((element)
                          //  {
                          //    if(element.data().containsValue(countryController.text + phone)){
                          //      ID  = element.id;
                          //      print(element.id);
                          //      print("*************");
                          //      print("yes");
                          //    }else{
                          //      print("no");
                          //    }
                          //    return ID;
                          //  });

                          print("yes");
                          checkUser = true;
                          // setState(() {
                          //   checkUser = true;
                          // });
                          break;
                        }
                      }

                      if (checkUser == true)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserInfoScreen()),
                        );
                      }else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      }
                    }); // End Check user in FireStore.
                  } catch (e) {
                    print("wrong otp");
                  }
                },
                title: 'Verify Phone Number',
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                        );
                      },
                      child: const Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
