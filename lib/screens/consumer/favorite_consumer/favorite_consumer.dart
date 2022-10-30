import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evspots/screens/favorite/model/favoite_model.dart';
import 'package:flutter/material.dart';

class FavoriteConsumer extends ChangeNotifier {
  var collection = FirebaseFirestore.instance.collection('favorite');
  List<myFavorite> listOfUsers = [];

  Future<List<myFavorite>> getData() async {
    listOfUsers.clear();
    var future = await collection.get();
    var docs = future.docs;
    docs.forEach((element) {
      listOfUsers.add(myFavorite.fromJson(element.data()));
    });

    return listOfUsers;
  }
}
