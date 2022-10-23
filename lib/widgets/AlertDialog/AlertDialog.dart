import 'package:flutter/material.dart';

showAlertDialog({required BuildContext context, required String title, required String content,  List<Widget>?actions }) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? "",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          content: Text(content ?? "",style: TextStyle(fontWeight: FontWeight.bold),),
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
