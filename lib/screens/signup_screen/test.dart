import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evspots/screens/sigin_screen/signin_screen.dart';
import 'package:evspots/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';

class TestFireStore extends StatefulWidget {
  const TestFireStore({Key? key}) : super(key: key);

  @override
  State<TestFireStore> createState() => _TestFireStoreState();
}

class _TestFireStoreState extends State<TestFireStore> {
  getData() async {
    var user = FirebaseFirestore.instance.collection('users');
    user.get().then((value) {
      value.docs.forEach((element) {
        element.data()['email'];
        // if(element.data().containsValue('motasem@gmail.com')){
        //   print("yes");
        // }else{
        //   print("no");
        // }
        if (element.data()['email'] == 'motasem55@gmail.com') {
          print("yes");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  SignInScreen()),
          );
        } else {
          print("no");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  SignUpScreen()),
          );
        }
        print(element.data()['email']);
        print("********************");
      });
    });
  }

  Future addData() async {
    final doc = FirebaseFirestore.instance.collection('users1').doc('test');

    final Map<String, dynamic> map = {
      "username": "motasem",
      "age": "22",
      "phone": "0787933934",
      "email": "motasem@gmail.com"
    };

    await doc.set(map);

    print('done');

    // usersRef.get().then((value) {
    //   value.docs.forEach((element) {
    //     print(element.data());
    //     print("***************************");
    //   });
    // });
  }

  @override
  void initState() {
   // addData();
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("mmmmmmmmmmm"),
          ElevatedButton(
            child: Text('Add'),
            onPressed: () async {
              print('before');
              await getData();
              print('after');
            },
          ),
        ],
      )),
    );
  }
}
