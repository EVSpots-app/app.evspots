import 'package:flutter/material.dart';

showAlertDialog({required BuildContext context, required String title, required String content,  List<Widget>?actions }) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: Text(content ?? ""),
          actions: (actions ?? [
            TextButton(
              onPressed: () {
                // SharedPreference().deletePrefs();
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Cancel'),
              ),
            ),
          ]),
        );
      });
}
