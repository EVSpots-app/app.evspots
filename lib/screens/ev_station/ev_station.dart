import 'package:evspots/themes/app_color.dart';
import 'package:evspots/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../widgets/home/ev_station/amenitiesCard.dart';
import '../../widgets/home/ev_station/connectionsCard.dart';

class EvStationInfo extends StatefulWidget {
  const EvStationInfo({Key? key}) : super(key: key);

  @override
  State<EvStationInfo> createState() => _EvStationInfoState();
}

class _EvStationInfoState extends State<EvStationInfo> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,

            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/EVStation.jpg'),
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: themeNotifier.isDark
                        ? AppColor.bodyColorDark
                        : AppColor.bodyColor,
                    boxShadow: [
                      BoxShadow(
                        color: themeNotifier.isDark
                            ? AppColor.bodyColorDark
                            : AppColor.bodyColor,
                        spreadRadius: 50,
                        blurRadius: 40,
                        offset: Offset(0, -5), // changes position of shadow
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
                            style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(height: height*0.01,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                child: Text(
                                  'Open .',
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.green),
                                ),
                                onPressed: () {},
                              ),
                              Text(
                                '\n08:00 am - 20:00 pm',
                                style:
                                TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                              SizedBox(width: 120,),
                              Icon(
                                Icons.favorite_border,
                                color: Colors.green,
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          const Text(
                            'Connections Available',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:const [
                              ConnectionsCard(),
                              ConnectionsCard(),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const[
                              ConnectionsCard(),
                              ConnectionsCard(),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),

                          const Text(
                            'Amenities ',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AmenitiesCard(),
                                AmenitiesCard(),
                                AmenitiesCard(),
                                AmenitiesCard(),
                                AmenitiesCard(),
                                AmenitiesCard(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            'Recent Check-ins ',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset('assets/images/pic1.jpg')),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const[
                                  Text(
                                    'Motasem Altamimi',
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Tesla Model X',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(width: width*0.08,),
                              Text(
                                '\n27 sep',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipisic ing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset('assets/images/pic1.jpg')),
                                ),
                                SizedBox(
                                  width: width * 0.025,
                                ),
                                SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset('assets/images/pic1.jpg')),
                                ),
                                SizedBox(
                                  width: width * 0.025,
                                ),
                                SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset('assets/images/pic1.jpg')),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Divider(thickness: 1),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset('assets/images/pic1.jpg')),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const[
                                  Text(
                                    'Motasem Altamimi',
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Tesla Model X',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(width: width*0.08,),
                              Text(
                                '\n27 sep',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipisic ing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}





