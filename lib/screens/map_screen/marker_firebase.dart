import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evspots/screens/map_screen/model/map_info_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../consumer/map/info_consumer.dart';

class Marker1 extends StatefulWidget {
  const Marker1({Key? key}) : super(key: key);

  @override
  State<Marker1> createState() => _Marker1State();
}

class _Marker1State extends State<Marker1> {
  // Set<Marker> getMarker (){
  //   return <Marker>[
  //     Marker(markerId: MarkerId('motsem'));
  //   ]
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(31.959935, 35.863575)),)
    );
  }

}
/*
Column(children: [
        Consumer<InfoConsumer>(
          builder: (context, consumer, child) {
            return Expanded(
                child: FutureBuilder(
                  future: consumer.getData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        itemCount: consumer.listOfPin.length,
                        itemBuilder: (context, index) {
                          InfoMap info = snapshot.data![index];
                          return Row(
                            children: [

                              Text(
                                info.name,
                                style: TextStyle(fontSize: 30),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                info.lng,
                                style: TextStyle(fontSize: 30),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                info.lng,
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ));
          },
        ),
      ]),
 */