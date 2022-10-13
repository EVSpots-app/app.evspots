import 'package:evspots/screens/main_page.dart';
import 'package:evspots/screens/sigin_screen/signin_screen.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:evspots/widgets/AppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../auth/shared_pref.dart';
import '../../generated/l10n.dart';
import '../../widgets/custom_button.dart';
import '../signup_screen/signup_screen.dart';

bool isLogin = false;

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

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
                onTap: ()  async {
                  try {
                    PhoneAuthCredential credential =
                    PhoneAuthProvider.credential(
                        verificationId: SignInScreen.verify,
                        smsCode: code);

                    //Sign the user in (or link) with the credential
                     UserCredential result =
                    await auth.signInWithCredential(credential);
                    SharedPreference().setLoggedin();
                    Navigator.pushAndRemoveUntil<void>(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                          const MainPage()),
                      ModalRoute.withName('/'),
                    );


                    // if(isLogin) {
                    //   print('sign in');
                    //   await auth.signInWithCredential(credential);
                    //   SharedPreference().setLoggedin();
                    //   Navigator.pushAndRemoveUntil<void>(
                    //     context,
                    //     MaterialPageRoute<void>(
                    //         builder: (BuildContext context) =>
                    //         const MainPage()),
                    //     ModalRoute.withName('/'),
                    //   );
                    // } else{
                    //   print('please signUp Now');
                    //   Navigator.pushAndRemoveUntil<void>(
                    //     context,
                    //     MaterialPageRoute<void>(
                    //         builder: (BuildContext context) =>
                    //          SignUpScreen()),
                    //     ModalRoute.withName('/'),
                    //   );
                    // }

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
// setLogin(bool value) async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.setBool(PREF_key, value);
// }
}
