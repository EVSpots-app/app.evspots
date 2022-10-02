import 'package:flutter/material.dart';

class ConnectionType extends StatefulWidget {
  ConnectionType({Key? key}) : super(key: key);

  @override
  State<ConnectionType> createState() => _ConnectionTypeState();
}

class _ConnectionTypeState extends State<ConnectionType> {
  bool color2 = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        color2 = !color2;
        setState(() {
          this.color2 = color2;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox(
          height: 110,
          width: 110,
          child: Stack(children: [
            SizedBox(
              height: 110,
              width: 110,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: this.color2
                        ? [Colors.blue, Colors.blue]
                        : [
                      Colors.blueAccent.withOpacity(0.05),
                      Colors.blueAccent.withOpacity(0.08),
                      Colors.blueAccent.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Text(
                  'Motasem',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Image.asset(
              'assets/images/connectionCar1.png',
            ),
          ]),
        ),
      ),
    );
  }
}