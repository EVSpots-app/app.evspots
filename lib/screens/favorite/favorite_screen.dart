import 'package:flutter/material.dart';
import '../../widgets/Images/logo_evspots.dart';
import '../../widgets/home/favorite_screen/favorite_card.dart';
import '../../widgets/home/favorite_screen/favorite_card_widgets.dart';
import '../filter/filter_screen.dart';
import '../map_screen/map_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Drawerkey.currentState!.openDrawer()),
          centerTitle: true,
          title: SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              FavoriteCard(),
              FavoriteCard(),
              FavoriteCard(),
              FavoriteCardWidgets(
                image: AssetImage('assets/images/ev.jpeg'),
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
              FavoriteCardWidgets(
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
            ],
          ),
        ));
  }
}
