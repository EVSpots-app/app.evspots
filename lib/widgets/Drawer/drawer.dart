import 'dart:convert';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evspots/screens/Profile/profile_screen.dart';
import 'package:evspots/screens/consumer/user_info_consumer/user_info_consumer.dart';
import 'package:evspots/screens/map_screen/map_screen.dart';
import 'package:evspots/screens/settings/app_settings.dart';
import 'package:evspots/screens/signup_screen/model/user_data_model.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:evspots/themes/theme_model.dart';
import 'package:evspots/widgets/ListTileWidgets/ListTileWidgets.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../auth/shared_pref.dart';
import '../../auth/shared_pref_keys.dart';
import '../../generated/l10n.dart';
import '../../screens/consumer/settings/consumer_settings.dart';
import '../../screens/Vehicles/vehicles.dart';
import '../../screens/sigin_screen/signin_screen.dart';
import '../AlertDialog/AlertDialog.dart';
import '../Images/logo_evspots.dart';
import '../Picture/ProfilePicture.dart';
import 'launch_in_browser.dart';

class MyDrawer extends StatelessWidget {
   MyDrawer({Key? key}) : super(key: key);

  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  Future<void>? _launched;

  TextEditingController _deleteAccount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ID = Provider.of<UserInfoConsumer>(context, listen: false).IdDoc;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final Uri toLaunch = Uri(
        scheme: 'https', host: 'en.wikipedia.org', path: 'wiki/Private_police');

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
        return Drawer(
          backgroundColor:
              themeNotifier.isDark ? Colors.black54 : Colors.white70,
          elevation: 0,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, top: 30, right: 25,),
                    child: Container(
                        width: width,
                        height: height * 0.18,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Consumer<UserInfoConsumer>(builder: (__,consumer,_){
                                return FutureBuilder(
                                    future: consumer.getUserDataWithSharedPref(),
                                    builder: ((context, snapshot) {
                                      if(!snapshot.hasData){
                                        return CircularProgressIndicator();
                                      }
                                      else if(snapshot.hasError){
                                        print(snapshot.error);
                                      }
                                      else if(snapshot.hasData){
                                        // MyUser user = snapshot.data!;
                                        // setData1('${user.firstName}');
                                        return Text(
                                          '${consumer.x2!['fname']}\n${consumer.x2!['lname']}',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Tajawal-Black',
                                              color: themeNotifier.isDark
                                                  ? AppColor.textColorDark
                                                  : AppColor.textColor),
                                        );

                                      }
                                    return CircularProgressIndicator();
                                    }
                                ));
                              },),


                              // SizedBox(
                              //   width: width * 0.25,
                              // ),
                              SizedBox(
                                width: width * 0.25,
                              ),
                              SizedBox(
                                width: width*0.2,
                                height: height*0.10,
                                child: MyPicture(),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.63,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            ListTileWidgets(
                              icon: Icon(
                                Icons.home,
                                color: themeNotifier.isDark
                                    ? AppColor.mainColor
                                    : AppColor.secColor,
                              ),
                              title: S.of(context).home,
                                onTap: (){
                                  Drawerkey.currentState!.openEndDrawer();
                                }
                                ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTileWidgets(
                                icon: Icon(
                                  Icons.car_crash,
                                  color: themeNotifier.isDark
                                      ? AppColor.mainColor
                                      : AppColor.secColor,
                                ),
                                title:S.of(context).vehicles,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Vehicles()),
                                  );
                                }
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTileWidgets(
                                icon: Icon(
                                  Icons.favorite,
                                  color: themeNotifier.isDark
                                      ? AppColor.mainColor
                                      : AppColor.secColor,
                                ),
                                title:S.of(context).favorite,
                                onTap: (){
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => const FavoriteScreen()),
                                  // );
                                }
                            ),

                            const Divider(),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTileWidgets(
                                icon: Icon(
                                  Icons.text_snippet,
                                  color: themeNotifier.isDark
                                      ? AppColor.mainColor
                                      : AppColor.secColor,
                                ),
                                title:S.of(context).terms,
                                onTap: (){}
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTileWidgets(
                                icon: Icon(
                                  Icons.privacy_tip,
                                  color: themeNotifier.isDark
                                      ? AppColor.mainColor
                                      : AppColor.secColor,
                                ),
                                title:S.of(context).privacyPolice,
                                onTap: (){_launched = LaunchInBrowser(toLaunch);}
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTileWidgets(
                                icon: Icon(
                                  Icons.question_mark,
                                  color: themeNotifier.isDark
                                      ? AppColor.mainColor
                                      : AppColor.secColor,
                                ),
                                title:S.of(context).helpFaqs,
                                onTap: (){}
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTileWidgets(
                                icon: Icon(
                                  Icons.message_rounded,
                                  color: themeNotifier.isDark
                                      ? AppColor.mainColor
                                      : AppColor.secColor,
                                ),
                                title:S.of(context).contactUs,
                                onTap: (){}
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTileWidgets(
                                icon: Icon(
                                  Icons.settings,
                                  color: themeNotifier.isDark
                                      ? AppColor.mainColor
                                      : AppColor.secColor,
                                ),
                                title:S.of(context).settings,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const AppSettings()),
                                  );
                                }
                            ),
                            SizedBox(
                              height: height * 0.025,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: GestureDetector(
                                onTap: () async {
                                  await showAlertDialog(
                                      context: context,
                                      title: 'LogOut',
                                      content: 'Are you sure ?',
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            SharedPreference().deletePrefs();
                                            Navigator.pushAndRemoveUntil<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                  builder: (BuildContext context) =>
                                                      SignInScreen()),
                                              ModalRoute.withName('/'),
                                            );
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Continue'),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Cancel'),
                                          ),
                                        ),
                                      ]);
                                },
                                child: Container(
                                  width: width,
                                  height: height * 0.06,
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.logout),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4.0),
                                        child: Text(S.of(context).logout,
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold)),
                                      ),

                                      // const Icon(Icons.logout),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: GestureDetector(
                                onTap: () async {
                                  await showAlertDialog(
                                      context: context,
                                      title: 'Delete Account',
                                      content:
                                      'Are you sure ? \nWrite "delete" if you sure ',
                                      actions: [
                                        TextField(
                                          controller: _deleteAccount,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                           if( _deleteAccount.text.toLowerCase() == 'delete'){

                                             var collection =
                                             FirebaseFirestore.instance.collection('users');
                                             collection.doc(ID).delete();
                                             SharedPreference().deletePrefs();
                                             Navigator.pushAndRemoveUntil<void>(
                                               context,
                                               MaterialPageRoute<void>(
                                                   builder: (BuildContext context) =>
                                                       SignInScreen()),
                                               ModalRoute.withName('/'),
                                             );

                                           }
                                           else{
                                             Navigator.pop(context);
                                           }


                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Continue'),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Cancel'),
                                          ),
                                        ),
                                      ]);

                                },
                                child: Container(
                                  width: width,
                                  height: height * 0.06,
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.remove_circle,
                                        color: Colors.redAccent,
                                      ),
                                      SizedBox(width: width * 0.03),
                                      Padding(
                                        padding: const EdgeInsets.all(2.5),
                                        child:  Text(S.of(context).deleteAccount,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Consumer<ChangeDropdownValue>(
                            builder: (_, changeDropdownValue, __) {
                              changeDropdownValue.setInitialLanguageValue() ;
                              return SizedBox();
                            }
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                child: SizedBox(
                  height: height * 0.06,
                  width: width*0.4,
                  child: LogoEVSpots(),
                ),
                  onTap: (){_launched = LaunchInBrowser(toLaunch);}
              ),
              FutureBuilder<PackageInfo>(
                future: _getPackageInfo(),
                builder: (BuildContext context,
                    AsyncSnapshot<PackageInfo> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('ERROR');
                  } else if (!snapshot.hasData) {
                    return const Text('Loading...');
                  }

                  final data = snapshot.data!;

                  return Text('Version ${data.version}',
                      style: const TextStyle(fontSize: 15));
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}


