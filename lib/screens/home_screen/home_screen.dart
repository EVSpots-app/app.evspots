

import 'package:evspots/screens/map_screen/map_screen.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/home/home_screen/image_slider.dart';



final List<String> imgList = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-ZJdec5w9w46ES-V8KWOMyFyngbRltPotsQ&usqp=CAU',
  'https://www.arabamerica.com/wp-content/uploads/2022/03/bmw-i4-1.jpeg',
  'https://images.cars.com/cldstatic/wp-content/uploads/ford-mustang-mach-e-gt-2021-02--scaled.jpg',
  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/audi-a6-e-tron-concept-104gg-1619458115.jpeg?crop=1xw:1xh;center,top&resize=480:*',
  'https://cars.usnews.com/images/article/201712/127376/1-_concept_vw_ID.Space_vizzion_DB2019AU01600_large_Cropped.jpg',
  'https://www.kbb.com/wp-content/uploads/2021/11/Hyundai-SEVEN-concept-front-three-quarter.jpg?w=763'
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// final GlobalKey<ScaffoldState> _key = GlobalKey();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        // key: key1,
        //appBar: const MyAppBar(),
        // drawer: const MyDrawer(),
        // bottomNavigationBar: const BottomBar(),
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 40, 8, 3),
                child: CustomSearchContainer(),
              ),
              SizedBox(height: height * 0.005),
              CarouselWithIndicatorDemo(),

              // SizedBox(height: height * 0.05),
              // MultipleItemDemo(),
            ],
          ),
        )
        // TextFormField(
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     prefixIcon: const Icon(Icons.location_pin,
        //         color: Colors.grey, size: 25),
        //     suffixIcon: SizedBox(
        //       width: width * 0.23,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           const Icon(Icons.filter_alt_rounded,
        //               color: Colors.grey, size: 25),
        //           GestureDetector(
        //             child: const Padding(
        //               padding: EdgeInsets.only(right: 10, left: 10),
        //               child: Picture(),
        //             ),
        //             onTap: () => Drawerkey.currentState!.openDrawer(),
        //           )
        //         ],
        //       ),
        //     ),
        //     hintText: S.of(context).search,
        //     hintStyle: TextStyle(fontSize: 16, color: Colors.white)
        //   ),
        // ),
        );
  }
}




