import 'package:flutter/material.dart';

class AmenitiesCardWidgets extends StatelessWidget {

  final String text;
  final IconData icon;

  const AmenitiesCardWidgets({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Stack(
            children:  [
              Positioned(
                  top: 20,
                  left: 20,
                  child: Icon(
                    icon,
                    size: 50,
                  )),
              Positioned(
                  bottom: 2,
                  left: 30,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,color: Colors.grey),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
