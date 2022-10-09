

import 'package:evspots/screens/ev_station/ev_station.dart';
import 'package:flutter/material.dart';

import '../favorite_screen/favorite_card.dart';
import '../favorite_screen/favorite_card_widgets.dart';

/// Content of the DraggableBottomSheet's child SingleChildScrollView
class CustomScrollViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24))),
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
            SizedBox(
              height: 310,
              width: 370,
              child: FavoriteCardWidgets(
                image: AssetImage('assets/images/manaseer.jpg'),
                titleText: 'Manaseer efill',
                locationText: ' Amman. 11110. Jordan Amman ',
                numConnections: '5 Point',
                amenities: [
                  Icon(Icons.shopping_cart,),
                  Icon(Icons.store,),
                  Icon(Icons.storefront_rounded,),
                  Icon(Icons.payments,),
                  Icon(Icons.payments,),
                  Icon(Icons.payments,),
                  Icon(Icons.payments,),
                  Icon(Icons.payments,),
                  Icon(Icons.payments,),
                ],
              ),
            ),
            const SizedBox(width: 12),
            CustomRestaurantCategory(),
            const SizedBox(width: 12),
            //CustomRestaurantCategory(),
            // const SizedBox(width: 12),
            // CustomRestaurantCategory(),
            const SizedBox(width: 12),
            CustomRestaurantCategory(),
            const SizedBox(width: 12),
            SizedBox(
              height: 310,
              width: 370,
              child: FavoriteCardWidgets(
                image: AssetImage('assets/images/manaseer.jpg'),
                titleText: 'Manaseer efill',
                locationText: ' Amman. 11110. Jordan Amman ',
                numConnections: '5 Point',
                amenities: [
                  Icon(Icons.shopping_cart,),
                  Icon(Icons.store,),
                  Icon(Icons.storefront_rounded,),
                  Icon(Icons.payments,),
                  Icon(Icons.payments,),
                  Icon(Icons.payments,),
                  Icon(Icons.payments,),
                  Icon(Icons.payments,),
                  Icon(Icons.payments,),
                ],
              ),
            ),
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
      child: SizedBox(
          height: 290,
          width: 370,
          child: FavoriteCard()),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EvStationInfo()),
        );
      },

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