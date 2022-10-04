import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/app_color.dart';
import '../themes/theme_model.dart';

class MyButton extends StatelessWidget {
  final Function() onTap;
  final String title;

  const MyButton({Key? key, required this.onTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
          return GestureDetector(
              onTap:onTap,
            child: Container(
              margin: const EdgeInsets.all(8),
              height: height * 0.07,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: themeNotifier.isDark
                      ? AppColor.mainColor
                      : AppColor.secColor,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child:  Text(
                title.toString(),
                style: TextStyle(fontSize: 16.0,

                    color: themeNotifier.isDark
                        ? AppColor.secColor
                        : AppColor.bodyColor,

                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        });
  }
}
