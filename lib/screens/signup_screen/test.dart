import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestFireStore extends StatefulWidget {
  const TestFireStore({Key? key}) : super(key: key);

  @override
  State<TestFireStore> createState() => _TestFireStoreState();
}

class _TestFireStoreState extends State<TestFireStore> {

  getData() async{
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        print(element.data()) ;
        print("==================================") ;
      });
    });
  }
  addData() async{
    var usersRef =
    FirebaseFirestore.instance.collection('users');
    usersRef.add({
      "username": "motasem",
      "age" : "22",
      "phone" :"0787933934",
      "email" :"motasem@gmail.com"
    });
  }
  @override
  void initState() {
    addData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("mmmmmmmmmmm")),
    );
  }
}
