import 'package:evspots/screens/home/consumer/all_consumer.dart';
import 'package:evspots/screens/home_screen.dart';
import 'package:evspots/screens/home_screen2.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../generated/l10n.dart';
import '../widgets/drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

List screen = [HomeScreen(), HomeScreen2()];

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Drawerkey,
      drawer: MyDrawer(),
      bottomNavigationBar:
          Consumer<ChangeRoutingPage>(builder: (_, changeIndex, __) {
        return SalomonBottomBar(
          currentIndex: changeIndex.currentIndex,
          //onTap: (i) => setState(() => _currentIndex = i),
          onTap: (i) {
            changeIndex.switchIndex(i);
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: Text(S.of(context).home),
              selectedColor: AppColor.secColor,
            ),

            /// location
            SalomonBottomBarItem(
              icon: const Icon(Icons.location_pin),
              title: Text("Location"),
               selectedColor: AppColor.secColor,
            ),

            /// Search
            // SalomonBottomBarItem(
            //   icon: const Icon(Icons.search),
            //   title: Text(S.of(context).search),
            //   selectedColor: Colors.orange,
            // ),

            /// Profile
            // SalomonBottomBarItem(
            //   icon: const Icon(Icons.person),
            //   title: Text(S.of(context).profile),
            //   selectedColor: Colors.teal,
            // ),
          ],
        );
      }),
      body: Consumer<ChangeRoutingPage>(builder: (_, changeIndex, __) {
        return screen[changeIndex.currentIndex];
      }),
    );
  }
}


