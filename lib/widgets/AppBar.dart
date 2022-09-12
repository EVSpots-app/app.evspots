import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class MyAppBar extends StatefulWidget with PreferredSizeWidget{
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
    return AppBar(
      title: Text(S.of(context).evspots),
    );
  }
}
