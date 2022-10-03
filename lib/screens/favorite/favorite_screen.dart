import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../themes/app_color.dart';
import '../../themes/theme_model.dart';
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

      appBar:AppBar(
        leading: IconButton(icon: Icon(Icons.menu),onPressed:() => Drawerkey.currentState!.openDrawer() ),
        centerTitle: true,
        title: Text("EVSpots"),
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
            FavoriteCard(),
          ],
        ),
      )

    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      shadowColor: Colors.black,
      elevation: 30,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                child: Stack(
                  children: [
                    Image.asset('assets/images/EVStation.jpg'),
                    Positioned(
                        top: 2,
                        left: 2,
                        right: 2,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: (){}, child: Text('Open',style: TextStyle(fontSize: 20,color: Colors.black),)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
                          ],)
                    ),

                  ],
                )),
            Consumer<ThemeModel>(
              builder: (context, ThemeModel themeNotifier, child) {
                return Container(
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                    color: themeNotifier.isDark
                        ? AppColor.bodyColorDark
                        : AppColor.bodyColor,

                    boxShadow: [
                      BoxShadow(
                        color: themeNotifier.isDark
                            ? AppColor.bodyColorDark
                            : AppColor.bodyColor,
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: Offset(0, -35), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 18,
                      left: 18,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Business Center',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'A522 , New York New York',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: height*0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Connections',style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),),
                                Text('8 Point',style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(width: width*0.1,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Amenities',style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),),
                                Row(children: [
                                  Icon(Icons.home_filled),
                                  Icon(Icons.home_filled),
                                  Icon(Icons.home_filled),
                                  Icon(Icons.home_filled),
                                ],)
                              ],
                            ),
                            SizedBox(width: width*0.1,),
                            Icon(Icons.navigation,size: 30,)
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ]),
    );
  }
}

