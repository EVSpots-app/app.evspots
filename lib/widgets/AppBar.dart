
import 'package:evspots/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../themes/theme_model.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const MyAppBar({Key? key,required this.title,  List<Widget>?actions,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
              color: themeNotifier.isDark
                  ? AppColor.bodyColor
                  : AppColor.secColor,
              fontFamily: 'Tajawal-Black'

          ),
        ),
        actions: [

        ],
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

  // Size get preferredSize => throw UnimplementedError();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
