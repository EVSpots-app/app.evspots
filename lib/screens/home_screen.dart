import 'package:flutter/material.dart';

import '../generated/l10n.dart';
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
      key: key1,
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),
      // bottomNavigationBar: const BottomBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.location_pin,
                    color: Colors.grey, size: 25),
                suffixIcon: SizedBox(
                  width: width * 0.23,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.filter_alt_rounded,
                          color: Colors.grey, size: 25),
                      GestureDetector(
                        child: const Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Picture(),
                        ),
                        onTap: () => key1.currentState!.openDrawer(),
                      )
                    ],
                  ),
                ),
                hintText: S.of(context).search,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
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
