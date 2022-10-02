import 'dart:async';
import 'package:evspots/screens/main_page.dart';
import 'package:evspots/screens/sigin_screen/signin_screen.dart';
import 'package:evspots/auth/shared_pref.dart';
import 'package:evspots/themes/theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () async{

      await SharedPreference().getLoggedin()
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => MainPage()))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => SignInScreen()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ThemeModel>(
            builder: (context, ThemeModel themeNotifier, child) {
          return Image.asset(themeNotifier.isDark
              ? 'assets/images/icon_for_dark_theme.png'
              : 'assets/images/icon_for_light_theme.png');
        }),
      )),
    );
  }
}
