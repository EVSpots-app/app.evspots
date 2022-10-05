import 'package:evspots/screens/consumer/home/all_consumer.dart';
import 'package:evspots/screens/favorite/favorite_screen.dart';
import 'package:evspots/screens/map_screen/map_screen.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../generated/l10n.dart';
import '../themes/theme_model.dart';
import '../widgets/Drawer/drawer.dart';
import 'home_screen/home_screen.dart';
import 'map_screen/enroute_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

List screen = [MapScreen(), EnrouteScreen(), FavoriteScreen()];

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Drawerkey,
      drawer: MyDrawer(),
      bottomNavigationBar:
          Consumer<ChangeRoutingPage>(builder: (_, changeIndex, __) {
        return Consumer<ThemeModel>(
          builder: (_, ThemeModel themeNotifier, __) {
            return SalomonBottomBar(
              currentIndex: changeIndex.currentIndex,
              //onTap: (i) => setState(() => _currentIndex = i),
              onTap: (i) {
                changeIndex.switchIndex(i);
              },
              items: [
                /// location
                SalomonBottomBarItem(
                  icon: const Icon(Icons.location_pin),
                  title: Text("NEARBY"),
                  selectedColor: themeNotifier.isDark
                      ? AppColor.bodyColor
                      : AppColor.secColor,
                ),

                /// Home
                SalomonBottomBarItem(
                  icon: const Icon(Icons.navigation),
                  title: Text('ENROUTE'),
                  selectedColor: themeNotifier.isDark
                      ? AppColor.bodyColor
                      : AppColor.secColor,
                ),

                /// Favorite
                SalomonBottomBarItem(
                  icon: const Icon(Icons.favorite),
                  title: Text("FAVORITE"),
                  selectedColor: themeNotifier.isDark
                      ? AppColor.bodyColor
                      : AppColor.secColor,
                ),

                /// Profile
                // SalomonBottomBarItem(
                //   icon: const Icon(Icons.person),
                //   title: Text(S.of(context).profile),
                //   selectedColor: Colors.teal,
                // ),
              ],
            );
          },
        );
      }),
      body: Consumer<ChangeRoutingPage>(builder: (_, changeIndex, __) {
        return screen[changeIndex.currentIndex];
      }),
    );
  }
}
