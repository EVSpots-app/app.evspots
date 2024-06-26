import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../themes/app_color.dart';
import '../../../themes/theme_model.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({Key? key}) : super(key: key);

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.only(
          left: width * 0.04, right: width * 0.04, top: 10, bottom: 10),
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
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                child: Stack(
                  children: [
                    Image(image: AssetImage('assets/images/EVStation2.jpg')),
                    Positioned(
                        top: 2,
                        left: 2,
                        right: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Open',
                                  style: TextStyle(
                                      fontSize: width * 0.045,
                                      color: Colors.black),
                                )),


                            // Consumer<ChangeFavoriteValue>(
                            //     builder: (_, changeFavoriteValue, __) {
                            //   return IconButton(
                            //       onPressed: () {
                            //         changeFavoriteValue.switchFavoriteValue(
                            //             changeFavoriteValue.favorite);
                            //       },
                            //       icon:  Icon(
                            //               Icons.favorite,
                            //               color: Colors.red,
                            //             ));
                            // },),


                          ],
                        )),
                  ],
                )),
            Consumer<ThemeModel>(
              builder: (context, ThemeModel themeNotifier, child) {
                return Container(
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
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
                    padding: EdgeInsets.only(
                      right: width * 0.04,
                      left: width * 0.04,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Business Center',
                          style: TextStyle(
                              fontSize: width * 0.07,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'A522 , New York New York',
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Connections',
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '8 Point',
                                  style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              width: width * 0.1,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amenities',
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.home_filled),
                                    Icon(Icons.home_filled),
                                    Icon(Icons.home_filled),
                                    Icon(Icons.home_filled),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: width * 0.1,
                            ),
                            Icon(
                              Icons.assistant_navigation,
                              size: width * 0.1,
                              color: Colors.green,
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.005,
                        )
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

class ChangeFavoriteValue extends ChangeNotifier {
  bool favorite = false;

  switchFavoriteValue(value) {
    favorite != value;
    notifyListeners();
  }
}


