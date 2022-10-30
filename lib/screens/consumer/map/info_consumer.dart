import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../map_screen/model/map_info_model.dart';

class InfoConsumer extends ChangeNotifier {
  var collection = FirebaseFirestore.instance.collection('location');
  List<InfoMap> listOfPin = [];
  List<LatLng> markers = [];
  List<String> images = [];
  List<String> names = [];

  Future<List<InfoMap>> getData() async {
    listOfPin.clear();
    var future = await collection.get();
    var docs = future.docs;
    docs.forEach((element) {
      listOfPin.add(InfoMap.fromJson(element.data()));
    });
    getMarkers();
    getImage();
    getName();
    // print('llllllllllllllllllll');
    // print(listOfPin.length);
    // print(markers.length);
    return listOfPin;
  }

  getMarkers() {
    markers.clear();
    for (InfoMap value in listOfPin) {
      markers.add(LatLng(double.parse(value.lat), double.parse(value.lng)));
    }
  }
  getImage() {
    images.clear();
    for (InfoMap value in listOfPin) {
      images.add('assets/icons/ev_pin_map.png');
    }
  }
  getName() {
    names.clear();
    for (InfoMap value in listOfPin) {
      names.add(value.name);
    }
  }
}
