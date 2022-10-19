import 'dart:ui';
import 'package:evspots/screens/Profile/profile_screen.dart';
import 'package:evspots/screens/map_screen/map_screen.dart';
import 'package:evspots/screens/settings/app_settings.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:evspots/themes/theme_model.dart';
import 'package:evspots/widgets/ListTileWidgets.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import '../../auth/shared_pref.dart';
import '../../generated/l10n.dart';
import '../../screens/consumer/settings/consumer_settings.dart';
import '../../screens/Vehicles/vehicles.dart';
import '../../screens/sigin_screen/signin_screen.dart';
import '../AlertDialog.dart';
import '../Images/logo_evspots.dart';
import '../Picture/ProfilePicture.dart';
import 'launch_in_browser.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  Future<void>? _launched;
  TextEditingController _deleteAccount = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                              Text(
                                'Motasem\nAltamimi',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Tajawal-Black',
                                    color: themeNotifier.isDark
                                        ? AppColor.textColorDark
                                        : AppColor.textColor),
                              ),

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
                    height: height * 0.55,
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
                            Consumer<ChangeDropdownValue>(
                            builder: (_, changeDropdownValue, __) {
                              changeDropdownValue.setInitialLanguageValue() ?? "English";
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
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
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
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
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
                              _deleteAccount.text.toLowerCase() == 'delete'
                                  ? Navigator.pushAndRemoveUntil<void>(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        SignInScreen()),
                                ModalRoute.withName('/'),
                              )
                                  : Navigator.pop(context);
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


