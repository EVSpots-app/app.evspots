import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evspots/screens/sigin_screen/signin_screen.dart';
import 'package:flutter/material.dart';

import '../../../auth/shared_pref.dart';
import '../../signup_screen/model/user_data_model.dart';

class UserInfoConsumer extends ChangeNotifier {
  var collection = FirebaseFirestore.instance.collection('users');

  Future<MyUser> getData() async {
    var future = await collection
        .where('phone', isEqualTo: countryController.text + phone)
        .get();
    var docs = future.docs;
    print(docs.first.data());
    MyUser user = MyUser.fromJson(docs.first.data());
    SharedPreference().setUserData(user);
    return user;
  }

  Map? x2;
  Future getUserDataWithSharedPref() async {
   String x = await SharedPreference().getUserData();
   print('getUserDataWithSharedPref');
   print(x.runtimeType);
   print(x);
  x2  = jsonDecode(x);
 print(x2!['phone']);
 return x2;

  }

  String? IdDoc;
  getDocsId({required String phone}) async {
    var user = FirebaseFirestore.instance.collection('users');
    user.get().then((value) {
      value.docs.forEach((element) {
        if(element.data().containsValue(phone)){
          IdDoc = element.id;
          // SharedPreference().setDocId(element.id);
          print(element.id);
          print("yes");
        }else{
          print("no");
        }
      });
    });
  }
 // var getIdW ;
 //  getDocsIdWithSharedPref() async {
 //    getIdW = await SharedPreference().getDocId();
 //  }

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
