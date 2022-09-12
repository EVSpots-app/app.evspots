import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../generated/l10n.dart';
import '../screens/home_screen2.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeIndex1>(builder: (_, changeIndex, __) {
      return SalomonBottomBar(
        currentIndex: changeIndex._currentIndex,
        //onTap: (i) => setState(() => _currentIndex = i),
        onTap: (i) {
          changeIndex.switchIndex(i);
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title:  Text(S.of(context).home),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title:  Text(S.of(context).likes),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title:  Text(S.of(context).search),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title:  Text(S.of(context).profile),
            selectedColor: Colors.teal,
          ),
        ],
      );
    });
  }
}

class ChangeIndex1 extends ChangeNotifier {
  int _currentIndex = 0;

  switchIndex(int i) {
    _currentIndex = i;
    notifyListeners();
  }
}
