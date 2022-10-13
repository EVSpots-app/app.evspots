import 'package:flutter/material.dart';

class SpeedsWidget extends StatefulWidget {
  final String name;
  const SpeedsWidget({Key? key, required this.name}) : super(key: key);

  @override
  State<SpeedsWidget> createState() => _SpeedsWidgetState();
}

class _SpeedsWidgetState extends State<SpeedsWidget> {
  bool valueCheck = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: this.valueCheck,
        onChanged: (bool? value) {
          setState(() {
            this.valueCheck = value!;
          });
        },
      ),
      title:  Text( widget.name
        ,style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold),),
    );
  }
}
