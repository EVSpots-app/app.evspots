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
  TextEditingController _email = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<UserInfoConsumer>(context, listen: false).getDocsId(phone: countryController.text + phone);
    var ID= Provider.of<UserInfoConsumer>(context, listen: false).IdDoc;
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
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    print('${snapshot.error}');
                  } else {
                    MyUser user = snapshot.data!;

                    _firstName.text = _firstName.text.isEmpty
                        ? user.firstName
                        : _firstName.text;
                    _lastName.text = _lastName.text.isEmpty
                        ? user.lastName!
                        : _lastName.text;
                    _email.text =
                        _email.text.isEmpty ? user.email : _email.text;
                    _phone.text =
                        _phone.text.isEmpty ? user.phone : _phone.text;

                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Check you data ...",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          const Text(
                            'First Name ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _firstName,
                              decoration: InputDecoration(
                                  // hintText: user.firstName,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.grey.shade500))),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          const Text(
                            'Last Name ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _lastName,
                              decoration: InputDecoration(
                                  //hintText: user.lastName,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.grey.shade500))),
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
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _phone,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  // hintText: user.phone,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.grey.shade500))),
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
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  // hintText: user.email,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.grey.shade500))),
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
                  phone: countryController.text + phone,
                  firstName: _firstName.text,);
              if (_lastName.text.isNotEmpty) user.lastName = _lastName.text;
              var collection = FirebaseFirestore.instance.collection('users');
              collection.doc(ID).update(user.toJson());

              SharedPreference().setUserData(user);
              SharedPreference().setLoggedin();
              Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MainPage()),
                ModalRoute.withName('/'),
              );
            },
            title: 'Update',
          ));
    });
  }
}
