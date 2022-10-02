import 'package:flutter/material.dart';

class ConnectionsCard extends StatelessWidget {
  const ConnectionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 150,
      child: Stack(
          children: [
            SizedBox(
              height: 120,
              width: 150,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent.withOpacity(0.08),
                      Colors.blueAccent.withOpacity(0.1),
                      Colors.blueAccent.withOpacity(0.3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  'Motasem',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Image.asset(
              'assets/images/connectionCar1.png',
            ),
            Positioned(
              top: 25,
              left: 10,
              child: Text(
                '55KW (128kih)',
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 80,
              left: 10,
              child: Text(
                '2Points',
              ),
            ),
          ]),
    );
  }
}
