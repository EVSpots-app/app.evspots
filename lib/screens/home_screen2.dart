import 'dart:async';
import 'package:evspots/screens/filter_screen.dart';
import 'package:evspots/screens/profile_screen.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:evspots/widgets/custom_map/optional_functions.dart';
import 'package:evspots/widgets/custom_map/view/custom_map_view.dart';
import 'package:evspots/widgets/drawer.dart';
import 'package:evspots/widgets/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../themes/theme_model.dart';
import '../widgets/BottomBar.dart';
import 'home_screen.dart';

final GlobalKey<ScaffoldState> Drawerkey = GlobalKey();

class HomeScreen2 extends StatefulWidget {
  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}
final TextEditingController _searchController = TextEditingController();
final Completer<GoogleMapController> _completer = Completer();

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: key1,
      // drawer: const MyDrawer(),
      body: Stack(
        children: <Widget>[
          CustomGoogleMap(),
         CustomHeader(),
          DraggableScrollableSheet(
            initialChildSize: 0.30,
            minChildSize: 0.15,
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

/// Google Map in the background
class CustomGoogleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomMapView();
    // return GMap();
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
                color: themeNotifier.isDark
                    ? AppColor.bodyColor
                    : AppColor.bodyColorDark,
              ),
              contentPadding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                  bottom: 10),
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
            padding: EdgeInsets.only(right: 10),
            child: SizedBox(width: 30, height: 30, child: Picker()),
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

/// Content of the DraggableBottomSheet's child SingleChildScrollView
class CustomScrollViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: CustomInnerContent(),
      ),
    );
  }
}

class CustomInnerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 12),
        CustomDraggingHandle(),
        const SizedBox(height: 16),
        CustomExploreBerlin(),
        const SizedBox(height: 16),
        CustomHorizontallyScrollingRestaurants(),
        const SizedBox(height: 24),
        CustomFeaturedListsText(),
        const SizedBox(height: 16),
        CustomFeaturedItemsGrid(),
        const SizedBox(height: 24),
        CustomRecentPhotosText(),
        const SizedBox(height: 16),
        CustomRecentPhotoLarge(),
        const SizedBox(height: 12),
        CustomRecentPhotosSmall(),
        const SizedBox(height: 16),
      ],
    );
  }
}

class CustomDraggingHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 30,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
    );
  }
}

class CustomExploreBerlin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Explore Berlin",
            style: TextStyle(fontSize: 22, color: Colors.black45)),
        const SizedBox(width: 8),
        Container(
          height: 24,
          width: 24,
          child: const Icon(Icons.arrow_forward_ios,
              size: 12, color: Colors.black54),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
        ),
      ],
    );
  }
}

class CustomHorizontallyScrollingRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomRestaurantCategory(),
            const SizedBox(width: 12),
            CustomRestaurantCategory(),
            const SizedBox(width: 12),
            CustomRestaurantCategory(),
            const SizedBox(width: 12),
            CustomRestaurantCategory(),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

class CustomFeaturedListsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      //only to left align the text
      child: Row(
        children: <Widget>[
          const Text("Featured Lists", style: TextStyle(fontSize: 14))
        ],
      ),
    );
  }
}

class CustomFeaturedItemsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        //to avoid scrolling conflict with the dragging sheet
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        shrinkWrap: true,
        children: <Widget>[
          CustomFeaturedItem(),
          CustomFeaturedItem(),
          CustomFeaturedItem(),
          CustomFeaturedItem(),
        ],
      ),
    );
  }
}

class CustomRecentPhotosText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: <Widget>[
          const Text("Recent Photos", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class CustomRecentPhotoLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomFeaturedItem(),
    );
  }
}

class CustomRecentPhotosSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFeaturedItemsGrid();
  }
}

class CustomRestaurantCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onTap: (){},

    );
  }
}

class CustomFeaturedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class ChangeTime extends ChangeNotifier {
  bool time1 = true;

  switchTime() {
    Timer(const Duration(seconds: 5), () {
      time1 = false;
      notifyListeners();
    });
  }
}
