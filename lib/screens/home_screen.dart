import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../themes/app_color.dart';
import '../themes/theme_model.dart';
import '../widgets/AppBar.dart';

import '../widgets/drawer.dart';
import 'home_screen2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// final GlobalKey<ScaffoldState> _key = GlobalKey();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      // key: key1,
      appBar: const MyAppBar(),
      // drawer: const MyDrawer(),
      // bottomNavigationBar: const BottomBar(),
      backgroundColor: Colors.grey,
      body: CustomSearchContainer(),
      // TextFormField(
      //   decoration: InputDecoration(
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(15),
      //     ),
      //     prefixIcon: const Icon(Icons.location_pin,
      //         color: Colors.grey, size: 25),
      //     suffixIcon: SizedBox(
      //       width: width * 0.23,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         children: [
      //           const Icon(Icons.filter_alt_rounded,
      //               color: Colors.grey, size: 25),
      //           GestureDetector(
      //             child: const Padding(
      //               padding: EdgeInsets.only(right: 10, left: 10),
      //               child: Picture(),
      //             ),
      //             onTap: () => Drawerkey.currentState!.openDrawer(),
      //           )
      //         ],
      //       ),
      //     ),
      //     hintText: S.of(context).search,
      //     hintStyle: TextStyle(fontSize: 16, color: Colors.white)
      //   ),
      // ),
    );
  }
}

// class Picture {
//
//   String pic ;
//   Picture(this.pic){
//     pic ='assets/pic1.jpg';
//   }
//
// }
class Picture extends StatelessWidget {
  const Picture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/images/pic1.jpg'),
    );
  }
}
