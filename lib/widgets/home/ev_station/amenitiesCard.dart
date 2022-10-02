import 'package:flutter/material.dart';

class AmenitiesCard extends StatelessWidget {
  const AmenitiesCard({Key? key}) : super(key: key);

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
            children: const [
              Positioned(
                  top: 20,
                  left: 20,
                  child: Icon(
                    Icons.fastfood,
                    size: 50,
                  )),
              Positioned(
                  bottom: 2,
                  left: 30,
                  child: Text(
                    'Food',
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
