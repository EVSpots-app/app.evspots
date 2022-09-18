import 'package:carousel_slider/carousel_slider.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:flutter/material.dart';
import '../widgets/AppBar.dart';
import 'home_screen2.dart';

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
        appBar: const MyAppBar(),
        // drawer: const MyDrawer(),
        // bottomNavigationBar: const BottomBar(),
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 10, 4, 3),
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


final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
      CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
    ]);
  }
}

class MultipleItemDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        viewportFraction: 1,
      ),
      itemCount: (imgList.length / 2).round(),
      itemBuilder: (context, index, realIdx) {
        final int first = index * 2;
        final int second = first + 1;
        return Row(
          children: [first, second].map((idx) {
            return Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image.network(imgList[idx], fit: BoxFit.cover),
              ),
            );
          }).toList(),
        );
      },
    ));
  }
}
