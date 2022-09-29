
import 'package:evspots/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../themes/theme_model.dart';

class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  // Size get preferredSize => throw UnimplementedError();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return AppBar(
        title: Text(
          S.of(context).evspots,
          style: TextStyle(
              color: themeNotifier.isDark
                  ? AppColor.bodyColor
                  : AppColor.secColor,
              fontFamily: 'Tajawal-Black'

          ),
        ),
        // actions: [
        //   IconButton(
        //     icon:
        //     Icon(Icons.filter_alt_rounded, size: 25, color: Colors.grey),
        //     onPressed: () {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (_) => FilterScreen()));
        //     },
        //   ),
        // ],
      );
    });
  }
}
