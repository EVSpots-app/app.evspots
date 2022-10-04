import 'package:flutter/material.dart';

import '../../widgets/AppBar.dart';
import '../../widgets/Drawer/drawer.dart';
import '../../widgets/Images/logo_evspots.dart';
import '../../widgets/custom_map/view/custom_map_view.dart';
import '../../widgets/custom_map/widget/custom_text_felid_enroute.dart';
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu),onPressed:() => Drawerkey.currentState!.openDrawer() ),
        centerTitle: true,
        title:  SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
            child: LogoEVSpots()),
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


