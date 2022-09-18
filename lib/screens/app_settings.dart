import 'package:evspots/screens/home_screen.dart';
import 'package:evspots/screens/signin_screen.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../themes/theme_model.dart';
import '../widgets/AppBar.dart';
import 'language_screen.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: const MyAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(S.of(context).settings,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: height * 0.01),
                  const Text("set your preferences",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  SizedBox(height: height * 0.05),
                  const Text("display_setting",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  SizedBox(height: height * 0.015),
                  GestureDetector(
                    onTap: () {
                      themeNotifier.isDark
                          ? themeNotifier.isDark = false
                          : themeNotifier.isDark = true;
                    },
                    child: Container(
                      width: width,
                      height: height * 0.06,
                      child: ListTile(
                        leading: Icon(
                          Icons.dark_mode_outlined,
                          color: themeNotifier.isDark
                              ? AppColor.mainColor
                              : AppColor.secColor,
                        ),
                        trailing: Icon(
                            themeNotifier.isDark
                                ? Icons.nightlight_round
                                : Icons.wb_sunny,
                            color: themeNotifier.isDark
                                ? Colors.white
                                : Colors.grey.shade900),
                        title: Text(S.of(context).darkMode,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  const Text("experience_an_excitiing_dark_mode",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  SizedBox(height: height * 0.06),
                  const Text("Select Language",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  SizedBox(height: height * 0.01),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LanguageScreen()),
                      );
                    },
                    child: Container(
                      width: width,
                      height: height * 0.06,
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.language,
                          color: themeNotifier.isDark
                              ? AppColor.mainColor
                              : AppColor.secColor,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey
                        ),
                        title: Text(S.of(context).selectLanguage,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.25),

                ],
              ),
              // SizedBox(height: height*0.4,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignInScreen()));
                },
                child: Container(
                  width: width,
                  height: height * 0.06,
                  color: Colors.transparent,
                  child: ListTile(
                    trailing: const Icon(Icons.logout),
                    title: Text(S.of(context).logout,
                        style: const TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold)),
                  ),
                ),
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

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('App Naconst me: ${data.appName}',
                          style: const TextStyle(fontSize: 15)),
                      Text('Packconst age Name: ${data.packageName}',
                          style: const TextStyle(fontSize: 15)),
                      Text('Verconst sion: ${data.version}',
                          style: const TextStyle(fontSize: 15)),
                      Text('Build Number: ${data.buildNumber}',
                          style: const TextStyle(fontSize: 15)),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
