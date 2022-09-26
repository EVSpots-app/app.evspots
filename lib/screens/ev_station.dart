import 'package:flutter/material.dart';

class EvStationInfo extends StatefulWidget {
  const EvStationInfo({Key? key}) : super(key: key);

  @override
  State<EvStationInfo> createState() => _EvStationInfoState();
}

class _EvStationInfoState extends State<EvStationInfo> {

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/EVStation.jpg'),
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(1),
                    spreadRadius: 30,
                    blurRadius: 10,
                    //offset: Offset(0, 5), // changes position of shadow
                  ),
                ] ,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 10,left: 10,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Business Center',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      Text('A522 , New York',style: TextStyle(fontSize: 20),),
                      Text('Open ',style: TextStyle(fontSize: 20),),
                      Text('Connections Available',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                child: Text('Motasem'),
                              ),
                            ),
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                child: Text('Motasem'),
                              ),
                            ),
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: const[
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                child: Text('Motasem'),
                              ),
                            ),
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                child: Text('Motasem'),
                              ),
                            ),
                      ],),
                      Text('Amenities ',style: TextStyle(fontSize: 25),),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Stack(children: const[
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Icon(Icons.fastfood,size: 50,)),
                                    Positioned(
                                        bottom: 2,
                                        left: 30,
                                        child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ],),
                                ),

                              ),
                            ),
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Stack(children: const[
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Icon(Icons.fastfood,size: 50,)),
                                    Positioned(
                                        bottom: 2,
                                        left: 30,
                                        child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ],),
                                ),

                              ),
                            ),
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Stack(children: const[
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Icon(Icons.fastfood,size: 50,)),
                                    Positioned(
                                        bottom: 2,
                                        left: 30,
                                        child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ],),
                                ),

                              ),
                            ),
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Stack(children: const[
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Icon(Icons.fastfood,size: 50,)),
                                    Positioned(
                                        bottom: 2,
                                        left: 30,
                                        child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ],),
                                ),

                              ),
                            ),
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Stack(children: const[
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Icon(Icons.fastfood,size: 50,)),
                                    Positioned(
                                        bottom: 2,
                                        left: 30,
                                        child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ],),
                                ),

                              ),
                            ),
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Stack(children: const[
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Icon(Icons.fastfood,size: 50,)),
                                    Positioned(
                                        bottom: 2,
                                        left: 30,
                                        child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ],),
                                ),

                              ),
                            ),
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Stack(children: const[
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Icon(Icons.fastfood,size: 50,)),
                                    Positioned(
                                        bottom: 2,
                                        left: 30,
                                        child: Text('Food',style: TextStyle(fontWeight: FontWeight.bold),)),
                                  ],),
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('Recent Check-ins ',style: TextStyle(fontSize: 20),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height :80,
                            width: 80,
                            child: Image.asset('assets/images/pic1.jpg'),
                          ),
                          SizedBox(width: 20,),
                          Text('Motasem Altamimi\nTesla Model X ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      )
                    ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
