import 'dart:async';
import 'package:evspots/generated/l10n.dart';
import 'package:evspots/screens/consumer/home/all_consumer.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:evspots/themes/theme_model.dart';
import 'package:evspots/widgets/custom_map/optional_functions.dart';
import 'package:evspots/widgets/custom_map/view/custom_map_view.dart';
import 'package:evspots/widgets/home/map_screen/custom_scroll_view_content.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/Picture/myPicture.dart';
import '../../widgets/Picture/ProfilePicture.dart';
import '../filter/filter_screen.dart';


final GlobalKey<ScaffoldState> Drawerkey = GlobalKey();

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}
final TextEditingController _searchController = TextEditingController();
final Completer<GoogleMapController> _completer = Completer();

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: key1,
      // drawer: const MyDrawer(),
      body: Stack(
        children: <Widget>[
          CustomMapView(),
          CustomHeader(),
          DraggableScrollableSheet(
            initialChildSize: 0.10,
            minChildSize: 0.10,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: CustomScrollViewContent(),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Search text field plus the horizontally scrolling categories below the text field
class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 3),
          child: CustomSearchContainer(),
        ),
        CustomSearchCategories(),
      ],
    );
  }
}

class CustomSearchContainer extends StatefulWidget {
  @override
  State<CustomSearchContainer> createState() => _CustomSearchContainerState();
}

class _CustomSearchContainerState extends State<CustomSearchContainer> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ChangeTime>(context, listen: false).switchTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeTime>(builder: (_, changeTime, __) {
      return Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
        return Container(
          height: 50,
          decoration: BoxDecoration(
              color: themeNotifier.isDark
                  ? AppColor.bodyColorDark
                  : AppColor.bodyColor,
              borderRadius: BorderRadius.circular(25)),
          child: Stack(
            children: [
              changeTime.time1
                  ? Center(
                      child: SizedBox(
                        height: 35,
                        child: Image.asset(themeNotifier.isDark
                            ? 'assets/images/logo_for_dark_theme.png'
                            : 'assets/images/logo_for_light_theme.png'),
                      ),
                    )
                  : SizedBox(),
              Row(
                children: <Widget>[
                  CustomIconAvatar(),
                  CustomTextField(),
                  CustomUserAvatar(),
                ],
              ),
            ],
          ),
        );
      });
    });
  }
}

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Expanded(
        child: GestureDetector(
          child: TextField(
            controller: _searchController,
            cursorHeight: 25,
            autofocus: false,
            enabled: false,
            textAlign: TextAlign.start,
            cursorColor: Colors.green,
            style: const TextStyle(
              // color: Colors.black,
              //fontFamily: 'PoppinsRegular',
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: S.of(context).search,
              hintStyle:  TextStyle(
                height: 4,
                color: themeNotifier.isDark
                    ? AppColor.bodyColor
                    : AppColor.bodyColorDark,
              ),
              contentPadding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                  bottom: 10,
                  right: 10
              ),
              fillColor: Colors.white,
              // filled: true,
              // prefixIcon: IconButton(
              //   icon: const Icon(Icons.search_rounded),
              //   color: Colors.grey,
              //   onPressed: () {},
              // ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              // suffixIcon: AnimatedSwitcher(
              //   duration: const Duration(microseconds: 300),
              //   child: _searchController.text.isNotEmpty
              //       ? IconButton(
              //     icon: const Icon(Icons.clear,size: 50,color: Colors.black,),
              //     onPressed: () {
              //       _searchController.clear();
              //     },
              //   )
              //       : const SizedBox(),
              // ),
            ),

            onTap: () {},
          ),
          onTap: () {
            mapSearch(
              context: context,
              searchController: _searchController,
              completer: _completer,
            );
          },
        ),
      );
    });
  }
}

class CustomUserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
      IconButton(
            icon:
            Icon(Icons.filter_alt_rounded, size: 25, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => FilterScreen()));
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 10,left: 10),
            child: SizedBox(width: 30, height: 30, child: MyPicture()),
          ),
        ],
      ),
      onTap: () => Drawerkey.currentState!.openDrawer(),
    );
  }
}

class CustomIconAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Padding(
        padding: EdgeInsets.only(right: 10, left: 13),
        child: SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(themeNotifier.isDark
                ? 'assets/images/icon_for_light.png'
                : 'assets/images/icon_for_dark.png')),
      );
    });
  }
}

class CustomSearchCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 12),
          CustomCategoryChip(Icons.local_gas_station, "Charging"),
          const SizedBox(width: 12),
          CustomCategoryChip(Icons.car_repair, "Repair"),
          const SizedBox(width: 12),
          CustomCategoryChip(Icons.tire_repair, "Tire"),
          const SizedBox(width: 12),
          CustomCategoryChip(Icons.key, "Key"),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

class CustomCategoryChip extends StatelessWidget {
  final IconData iconData;
  final String title;

  CustomCategoryChip(this.iconData, this.title);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        children: <Widget>[
          Icon(iconData, size: 16),
          const SizedBox(width: 8),
          Text(title)
        ],
      ),
      // backgroundColor: Colors.grey[50],
    );
  }
}




