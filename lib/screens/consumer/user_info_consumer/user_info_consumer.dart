import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evspots/auth/shared_pref.dart';
import 'package:evspots/screens/sigin_screen/signin_screen.dart';
import 'package:flutter/material.dart';

import '../../signup_screen/model/user_data_model.dart';

class UserInfoConsumer extends ChangeNotifier {
  var collection = FirebaseFirestore.instance.collection('users');

  Future<MyUser> getData() async {
    var future = await collection
     .where('phone', isEqualTo: countryController.text + phone)
     //    .where('phone', isEqualTo: '+962787933934')
        .get();
    var docs = future.docs;
    print(docs.first.data());
    MyUser user = MyUser.fromJson(docs.first.data());
    SharedPreference().setData();
    return user;
  }

  // Future<MyUser2> getData2() async {
  //   var future = await collection
  //       .where('phone', isEqualTo: countryController.text + phone)
  //   // .where('phone', isEqualTo: '+962787933934')
  //       .get();
  //   var docs = future.docs;
  //   print(docs.first.data());
  //   MyUser2 user = MyUser2.fromJson(docs.first.data());
  //   return user;
  // }
}
