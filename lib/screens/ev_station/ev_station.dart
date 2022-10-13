import 'package:evspots/main.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:evspots/themes/theme_model.dart';
import 'package:evspots/widgets/ListTileWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../widgets/home/ev_station/amenitiesCard.dart';
import '../../widgets/home/ev_station/connectionsCard.dart';
import 'add_check_in.dart';

class EvStationInfo extends StatefulWidget {
  const EvStationInfo({Key? key}) : super(key: key);

  @override
  State<EvStationInfo> createState() => _EvStationInfoState();
}

class _EvStationInfoState extends State<EvStationInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                Image.asset('assets/images/EVStation2.jpg'),
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
                      right: 15,
                      left: 15,
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
                              SizedBox(width: width*0.25,),
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
                                AmenitiesCardWidgets(text: 'Food', icon: Icons.fastfood,),
                                AmenitiesCardWidgets(text: 'Food', icon: Icons.fastfood,),
                                AmenitiesCardWidgets(text: 'Food', icon: Icons.fastfood,),
                                AmenitiesCardWidgets(text: 'Food', icon: Icons.fastfood,),
                                AmenitiesCardWidgets(text: 'Food', icon: Icons.fastfood,),

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
                                height: height*0.073,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset('assets/images/pic1.jpg')),
                              ),
                               SizedBox(
                                width: width*0.04,
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
                                  height: height*0.1,
                                  // width: 80,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset('assets/images/pic1.jpg')),
                                ),
                                SizedBox(
                                  width: width * 0.025,
                                ),
                                SizedBox(
                                  height: height*0.1,

                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset('assets/images/pic1.jpg')),
                                ),
                                SizedBox(
                                  width: width * 0.025,
                                ),
                                SizedBox(
                                  height: height*0.1,

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
                                height: height*0.073,

                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset('assets/images/pic1.jpg')),
                              ),
                               SizedBox(
                                width: width*0.04,
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
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  child: Container(
                    color: AppColor.button5,
                    height: height*0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.car_crash),
                        SizedBox(width: width*0.05,),
                        Text('Add Check-in',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCheckIn()),
                  );},
                ),
              ),
              Expanded(
                child: GestureDetector(

                  onTap: (){},
                  child: Container(

                    height: height*0.06,
                    color: AppColor.mainColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.navigation),
                        SizedBox(width: width*0.05,),
                        Text('Get Direction',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}





