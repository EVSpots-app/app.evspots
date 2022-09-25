import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChangeMapTheme extends StatefulWidget {
  final Completer<GoogleMapController> completer;
  const ChangeMapTheme({Key? key, required this.completer}) : super(key: key);

  @override
  State<ChangeMapTheme> createState() => _ChangeMapThemeState();
}

class _ChangeMapThemeState extends State<ChangeMapTheme> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            widget.completer.future.then((value) {
              DefaultAssetBundle.of(context)
                  .loadString('assets/images/home/map_style.json')
                  .then((string) {
                setState(() {});
                value.setMapStyle(string);
              });
            }).catchError((error) {
              debugPrint("error" + error.toString());
            });
          },
          child: const Text("Retro"),
          value: 1,
        ),
        PopupMenuItem(
          onTap: () async {
            widget.completer.future.then((value) {
              DefaultAssetBundle.of(context)
                  .loadString('assets/images/home/night_style.json')
                  .then((string) {
                setState(() {});
                value.setMapStyle(string);
              });
            }).catchError((error) {
              debugPrint("error" + error.toString());
            });
          },
          child: const Text("Night"),
          value: 2,
        )
      ],
    );
  }
}
