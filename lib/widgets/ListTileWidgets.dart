import 'dart:ui';
import 'package:evspots/screens/app_settings.dart';
import 'package:flutter/material.dart';

class ListTileWidgets extends StatelessWidget {
  final Icon icon;
  final String title;
  final Function() onTap;

  ListTileWidgets({Key? key,
    required this.icon,
    required this.title,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 6.3),
        child: icon,
      ),
      title: Text(title.toString(),
        style:  TextStyle(
            fontSize: 20),
      ),
      onTap:onTap
    );
  }
}

