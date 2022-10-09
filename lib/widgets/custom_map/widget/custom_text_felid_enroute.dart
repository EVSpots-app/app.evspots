
import 'package:flutter/material.dart';

import '../../../screens/map_screen/map_screen.dart';

class CustomTextFieldEnroute extends StatelessWidget {
  const CustomTextFieldEnroute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Positioned(
      top: height*0.03,
      left: width*0.08,
      right: width*0.08,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
        ),
        padding: EdgeInsets.all(10),
        height: height*0.20,
        width: width*0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.location_pin,color: Colors.grey),
                SizedBox(width: width*0.05,),
                CustomTextField(hint: 'Enter Starting Point'),

              ],
            ),
            SizedBox(height: height*0.0005,),
            Row(
              children: [
                Icon(Icons.more_vert,color: Colors.grey),
                SizedBox(width: width*0.04,),
                Divider(
                  thickness: 3,
                  //height: height*0.04,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: height*0.0005,),

            Row(
              children: [
                Icon(Icons.navigation,color: Colors.grey),
                SizedBox(width: width*0.05,),
                CustomTextField(hint: 'Enter destination point',),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//Enter Starting Point
//Enter destination point
