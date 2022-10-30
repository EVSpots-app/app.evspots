import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evspots/generated/l10n.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:evspots/themes/theme_model.dart';
import 'package:evspots/widgets/Gender/Gender.dart';
import 'package:evspots/widgets/CustomButton/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../auth/shared_pref.dart';
import '../../auth/shared_pref_keys.dart';
import '../../widgets/Picture/ProfilePicture.dart';
import '../consumer/profile/birth_date_consumer.dart';
import '../consumer/user_info_consumer/user_info_consumer.dart';
import '../sigin_screen/signin_screen.dart';
import '../signup_screen/model/user_data_model.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController myBirthDate = TextEditingController();

  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  var ID;

  // String initValue="Select your Birth Date";
  // @override
  // void initState() {
  //   SharedPreference().getData();
  //   // print(SharedPreference().getData());
  //   super.initState();
  // }
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
            // backgroundColor: themeNotifier.isDark
            //     ? AppColor.bodyColorDark
            //     : AppColor.bodyColor,
            // title: Text(
            //   S.of(context).profile,
            //   style: TextStyle(
            //       color: themeNotifier.isDark
            //           ? AppColor.bodyColor
            //           : AppColor.secColor,
            //       fontFamily: 'Tajawal-Black'),
            // ),
          ),
          body: Consumer<UserInfoConsumer>(
            builder: (_, consumer, __) {
              return FutureBuilder(
                future: consumer.getUserDataWithSharedPref(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    print('${snapshot.error}');
                  } else {

                    _firstName.text = _firstName.text.isEmpty
                        ? consumer.x2!['fname']
                        : _firstName.text;
                    _lastName.text = _lastName.text.isEmpty
                        ? consumer.x2!['lname']
                        : _lastName.text;
                    _email.text =
                        _email.text.isEmpty ? consumer.x2!['email'] : _email.text;
                    _phone.text =
                        _phone.text.isEmpty ? consumer.x2!['phone'] : _phone.text;

                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).profile,
                                style: TextStyle(
                                    fontSize: 40,
                                    color: themeNotifier.isDark
                                        ? AppColor.bodyColor
                                        : AppColor.secColor,
                                    fontFamily: 'Tajawal-Black'),
                              ),
                              ProfilePicture(),
                            ],
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
                          // SizedBox(
                          //   height: height * 0.02,
                          // ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _firstName,
                              decoration: InputDecoration(
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
                          // SizedBox(
                          //   height: height * 0.02,
                          // ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _lastName,
                              decoration: InputDecoration(
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
                          // SizedBox(
                          //   height: height * 0.02,
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IntlPhoneField(
                              controller: _phone,
                              decoration: InputDecoration(
                                  // labelText: user.phone,
                                  // labelStyle: TextStyle(
                                  //     color: Colors.grey
                                  // ),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.grey.shade500))),
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                              onCountryChanged: (country) {
                                print('Country changed to: ' + country.name);
                              },
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
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
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
                            'Birth Date ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),

                          Consumer<BirthDate>(
                            builder: (_, consumer, __) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  child: ListTile(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.grey.shade500)),
                                      title: Text(
                                        "${consumer.birthDateInString}",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      trailing: Icon(Icons.calendar_today),
                                      onTap: () async {
                                        final datePick = await showDatePicker(
                                            context: context,
                                            initialDate: new DateTime.now(),
                                            firstDate: new DateTime(1900),
                                            lastDate: new DateTime(2100));
                                        if (datePick != null &&
                                            datePick != consumer.birthDate) {
                                          consumer.ChangeBirthDate(
                                              consumer.birthDate = datePick);
                                        }
                                      }),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Center(
                            child: Text(
                              'Gender*',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          getWidget(true, true),
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
            onTap: () {},
            title: 'Update',
          ));
    });
  }
}
