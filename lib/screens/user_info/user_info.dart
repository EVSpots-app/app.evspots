import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evspots/screens/consumer/user_info_consumer/user_info_consumer.dart';
import 'package:evspots/screens/signup_screen/model/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/shared_pref.dart';
import '../../themes/app_color.dart';
import '../../themes/theme_model.dart';
import '../../widgets/CustomButton/custom_button.dart';
import '../main_page.dart';
import '../sigin_screen/signin_screen.dart';

// ignore: must_be_immutable
class UserInfoScreen extends StatefulWidget {

  UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
   TextEditingController _phone = TextEditingController();
  TextEditingController _email= TextEditingController();
  TextEditingController _fullName= TextEditingController();
 var ID;
 @override
  void initState() {
   getData(phone: countryController.text + phone);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
          // backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(
              color:
                  themeNotifier.isDark ? AppColor.bodyColor : AppColor.secColor,
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Consumer<UserInfoConsumer>(
            builder: (_, consumer, __) {
              return FutureBuilder(
                future: consumer.getData(),
                builder: ((context, snapshot) {

                 // _phone = TextEditingController(text: user.phone);
                 // _fullName = TextEditingController(/*text: user.fullName*/);
                 // _email = TextEditingController(text: user.email);

                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    print('${snapshot.error}');
                  } else  {
                    MyUser user = snapshot.data!;
                    // _phone.addListener(() {
                    //     _phone.text = user.phone;
                    // });
                    // _email.addListener(() {
                    //   _email.text = user.email;
                    // });
                    // _fullName.addListener(() {
                    //   setState(() {
                    //     _fullName.text = user.fullName;
                    //   });
                    // });
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Check you data ...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          const Text(
                            'Full Name ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          // SizedBox(
                          //   height: height * 0.02,
                          // ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller:_fullName,
                              // onChanged: (value){
                              //    setState(() {
                              //      user.fullName = value;
                              //    });
                              // },
                              decoration: InputDecoration(
                               hintText: user.fullName,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                      BorderSide(width: 2, color: Colors.grey.shade500))),
                            ),
                          ),

                          SizedBox(
                            height: height * 0.04,
                          ),
                          const Text(
                            'Phone Number ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          // SizedBox(
                          //   height: height * 0.02,
                          // ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _phone,
                              // onChanged: (value){
                              //   setState(() {
                              //     user.phone = value;
                              //   });
                              // },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                 hintText: user.phone,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                      BorderSide(width: 2, color: Colors.grey.shade500))),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            'Email Address ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          // SizedBox(
                          //   height: height * 0.02,
                          // ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                            controller: _email,
                            //   onChanged: (value){
                            //     setState(() {
                            //       user.email = value;
                            //     });
                            //   },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                               hintText: user.email,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                      BorderSide(width: 2, color: Colors.grey.shade500))),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
              );
            },
          ),
          bottomNavigationBar: MyButton(
            onTap: () async {


                MyUser user = MyUser(
                    email: _email.text,
                    phone: countryController.text + phone);
                if (_fullName.text.isNotEmpty)
                  user.fullName = _fullName.text;
                var collection =
                FirebaseFirestore.instance.collection('users');
                collection.doc(ID).update(user.toJson());

               // collection.add(user.toJson());

              SharedPreference().setLoggedin();
              Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                    const MainPage()),
                ModalRoute.withName('/'),
              );

            },
            title: 'Update',
          ));
    });
  }
  getData({required String phone}) async {
    var user = FirebaseFirestore.instance.collection('users');
    user.get().then((value) {
      value.docs.forEach((element) {
        if(element.data().containsValue(phone)){
          ID = element.id;
          print(element.id);
          print("yes");
        }else{
          print("no");
        }
        return ID;
      });
    });
  }
}
