import 'dart:ui';
import 'package:evspots/screens/app_settings.dart';
import 'package:evspots/screens/profile_screen.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:evspots/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../generated/l10n.dart';
import '../screens/home_screen2.dart';
import '../screens/vehicles.dart';

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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final Uri toLaunch =
    Uri(scheme: 'https', host: 'en.wikipedia.org', path: 'wiki/Private_police');

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
                    padding: const EdgeInsets.only(left: 25, top: 30,right: 25),
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
                                  width: 80,
                                  height: 80,
                                  child: Picker()),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.65,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.home,
                                color: themeNotifier.isDark
                                    ? AppColor.mainColor
                                    : AppColor.secColor,
                              ),
                              title: Text(
                                S.of(context).home,
                                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Drawerkey.currentState!.openEndDrawer();
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.car_crash,
                                color: themeNotifier.isDark
                                    ? AppColor.mainColor
                                    : AppColor.secColor,
                              ),
                              title: const Text(
                                'Vehicles',
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const Vehicles()),
                                );
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.favorite,
                                color: themeNotifier.isDark
                                    ? AppColor.mainColor
                                    : AppColor.secColor,
                              ),
                              title: const Text(
                                'Favorite',
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              onTap: () {},
                            ),
                            const Divider(),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.text_snippet_outlined,
                                color: themeNotifier.isDark
                                    ? AppColor.mainColor
                                    : AppColor.secColor,
                              ),
                              title: const Text(
                                'Terms & Condition',
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              onTap: () {},
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.privacy_tip,
                                color: themeNotifier.isDark
                                    ? AppColor.mainColor
                                    : AppColor.secColor,
                              ),
                              title: const Text(
                                'Praivace & Police',
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                _launched = _launchInBrowser(toLaunch);
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.question_mark,
                                color: themeNotifier.isDark
                                    ? AppColor.mainColor
                                    : AppColor.secColor,
                              ),
                              title: const Text(
                                'FAQs',
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              onTap: () {},
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.message,
                                color: themeNotifier.isDark
                                    ? AppColor.mainColor
                                    : AppColor.secColor,
                              ),
                              title: const Text(
                                'Contact Us',
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              onTap: () {},
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.settings,
                                color: themeNotifier.isDark
                                    ? AppColor.mainColor
                                    : AppColor.secColor,
                              ),
                              title: Text(
                                S.of(context).settings,
                                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AppSettings()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height*0.06,
                child: Image.asset(themeNotifier.isDark
                    ? 'assets/images/logo_for_dark_theme.png'
                    : 'assets/images/logo_for_light_theme.png'),
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

                  return Text('Verconst sion: ${data.version}',
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
Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}
// Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 250),
// child: InkWell(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => ProfileScreen()),
// );
// },
// child: SizedBox(
// width: 80,
// height: 80,
// child: const Picture())),
// ),
// SizedBox(
// height: height * 0.03,
// ),
// GestureDetector(
// onTap: () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => SignInScreen()));
// },
// child: Container(
// width: width,
// height: height * 0.06,
// color: Colors.transparent,
// child: ListTile(
// trailing: const Icon(Icons.arrow_forward_ios),
// title: Text(
// S.of(context).motasemAltamimi,
// style: themeNotifier.isDark
// ? AppFont.boldDark
//     : AppFont.bold,
// ),
// ),
// ),
// ),
// ]
// ),
