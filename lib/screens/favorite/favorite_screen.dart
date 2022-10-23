import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/Images/logo_evspots.dart';
import '../../widgets/home/favorite_screen/favorite_card_widgets.dart';
import '../consumer/favorite_consumer/favorite_consumer.dart';
import '../filter/filter_screen.dart';
import '../map_screen/map_screen.dart';
import 'model/favoite_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      // backgroundColor: Colors.yellow,
      // color: Colors.red,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 1500));
        setState(() {});
      },
      child: Scaffold(
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
        body: Consumer<FavoriteConsumer>(
          builder: (_, consumer, __) {
            return FutureBuilder(
              future: consumer.getData(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print('${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: consumer.listOfUsers.length,
                    itemBuilder: (context, index) {
                      myFavorite favObject = consumer.listOfUsers[index];
                      return FavoriteCardWidgets(
                        image: NetworkImage(favObject.image.isNotEmpty
                            ? favObject.image
                            : "https://t4.ftcdn.net/jpg/01/93/90/27/360_F_193902732_Rdkidq0xZ0TT6Tdt0kuQUUsue6PQOV5g.jpg"),
                        titleText: favObject.titleText.isNotEmpty
                            ? favObject.titleText
                            : 'E_Fill Name',
                        locationText: favObject.locationText.isNotEmpty
                            ? favObject.locationText
                            : "E_Fill Location ",
                        numConnections: favObject.numConnections.isNotEmpty
                            ? favObject.numConnections
                            : "0 Point",
                        amenities: [
                          Icon(
                            Icons.shopping_cart,
                          ),
                          Icon(
                            Icons.store,
                          ),
                          Icon(
                            Icons.storefront_rounded,
                          ),
                          Icon(
                            Icons.ac_unit_outlined,
                          ),
                          Icon(
                            Icons.access_alarm,
                          ),
                          Icon(
                            Icons.payments,
                          ),
                          Icon(
                            Icons.abc_rounded,
                          ),
                          Icon(
                            Icons.payments,
                          ),
                          Icon(
                            Icons.account_balance,
                          ),
                        ],
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              }),
            );
          },
        ),
      ),
    );
  }
}
