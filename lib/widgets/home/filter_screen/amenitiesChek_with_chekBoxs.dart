import 'package:flutter/material.dart';

class AmenitiesChek extends StatefulWidget {
  const AmenitiesChek({Key? key}) : super(key: key);

  @override
  State<AmenitiesChek> createState() => _AmenitiesChekState();
}

class _AmenitiesChekState extends State<AmenitiesChek> {
  bool value4 = false;
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
              const Positioned(
                  top: 20,
                  left: 20,
                  child: Icon(
                    Icons.fastfood,
                    size: 50,
                  )),
              const Positioned(
                  bottom: 2,
                  left: 30,
                  child: Text(
                    'Food',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,color: Colors.grey),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(
                    value: this.value4,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value4 = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}