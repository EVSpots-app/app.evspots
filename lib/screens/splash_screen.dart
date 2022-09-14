import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme_model.dart';
import 'main_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MainPage())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ThemeModel>(
            builder: (context, ThemeModel themeNotifier, child) {
              return Image.asset(
                themeNotifier.isDark
                    ?'assets/images/icon_for_dark_theme.png'
                    :'assets/images/icon_for_light_theme.png'
              );
            }),

      )),
    );
  }
}
