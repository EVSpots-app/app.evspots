import 'package:flutter/material.dart';

import '../../widgets/AppBar.dart';
import '../../widgets/Drawer/drawer.dart';
import '../../widgets/custom_map/view/custom_map_view.dart';
import '../filter/filter_screen.dart';
import 'map_screen.dart';


class EnrouteScreen extends StatefulWidget {
  const EnrouteScreen({Key? key}) : super(key: key);

  @override
  State<EnrouteScreen> createState() => _EnrouteScreenState();
}

class _EnrouteScreenState extends State<EnrouteScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu),onPressed:() => Drawerkey.currentState!.openDrawer() ),
        centerTitle: true,
        title: Text("EVSpots",),
        actions: [
          IconButton(
            icon:
            Icon(Icons.filter_alt_rounded, size: 25, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => FilterScreen()));
            },
          ),
        ],
      ),

      body: Stack(
        children: <Widget>[
          CustomMapView(),
          CustomTextFieldEnroute(),
        ],
      ),
    );
  }
}

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
            borderRadius: BorderRadius.circular(8),
            color: Colors.white
        ),
        padding: EdgeInsets.all(10),
        height: height*0.15,
        width: width*0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.location_pin,color: Colors.grey),
                SizedBox(width: width*0.04,),
                SizedBox(
                  width: width*0.5,
                  height: height*0.04,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter Starting Point',
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),),

              ],
            ),
            SizedBox(height: height*0.0005,),
            Row(
              children: [
                Icon(Icons.more_vert,color: Colors.grey),
                SizedBox(width: width*0.04,),
                Divider(
                  height: height*0.04,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: height*0.0005,),

            Row(
              children: [
                Icon(Icons.navigation,color: Colors.grey),
                SizedBox(width: width*0.04,),
                SizedBox(
                  width: width*0.5,
                  height: height*0.04,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter destination point',
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

