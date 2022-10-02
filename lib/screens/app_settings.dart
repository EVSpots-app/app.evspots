import 'package:evspots/constans/shared_pref.dart';
import 'package:evspots/localization/app_model.dart';
import 'package:evspots/screens/home/consumer/all_consumer.dart';
import 'package:evspots/screens/signin_screen.dart';
import 'package:evspots/themes/app_color.dart';
import 'package:evspots/widgets/AlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../generated/l10n.dart';
import '../themes/theme_model.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  TextEditingController _deleteAccount = TextEditingController();

 @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Consumer<ChangeDropdownValue>(
          builder: (_, changeDropdownValue, __) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color:
                  themeNotifier.isDark ? AppColor.bodyColor : AppColor.secColor,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(S.of(context).settings,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        // IconButton(
                        //     onPressed: () {
                        //       _onShare(context);
                        //     },
                        //     icon: const Icon(Icons.share)),
                      ],
                    ),
                    const Text("Your Question got answered",
                        style: TextStyle(fontSize: 17, color: Colors.grey)),
                    SizedBox(height: height * 0.05),
                    Text(S.of(context).selectLanguage,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    DropdownButton(
                      // hint: Text('Distance Unity'),
                      isExpanded: true,
                      icon: const Icon(
                        Icons.expand_more,
                      ),
                      value: changeDropdownValue.initialLanguageValue,
                      onChanged: (String? newValue2) async {
                        changeDropdownValue.switchDropdownLanguage(
                            language: newValue2!);
                      },
                      items: ChangeDropdownValue.languages
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: ListTile(
                            trailing:
                                value == changeDropdownValue.initialLanguageValue
                                    ? Icon(
                                        Icons.check,
                                        color: AppColor.mainColor,
                                      )
                                    : null,
                            leading:
                                const Icon(Icons.language, color: Colors.grey),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(value,
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          ),
                          onTap: () async {
                            value == ChangeDropdownValue.dropdownValueEN
                                ? AppModel.shared.changeLanguageToEn('en')
                                : AppModel.shared.changeLanguageToAr('ar');
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: height * 0.015),
                    const Text("App Mode",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    DropdownButton(
                      // hint: Text('Distance Unity'),
                      isExpanded: true,
                      icon: const Icon(
                        Icons.expand_more,
                      ),
                      value: changeDropdownValue.dropdownValue4,
                      onChanged: (String? newValue3) {
                        changeDropdownValue.switchDropdownValue4(newValue3);
                      },
                      items: <String>['Dark Mode', 'Light Mode']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          onTap: () {
                            value == 'Dark Mode'
                                ? themeNotifier.isDark = true
                                : themeNotifier.isDark = false;
                          },
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 20),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: height * 0.015),
                    const Text('Distance Unit',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    // SizedBox(height: height * 0.008),
                    DropdownButton(
                      hint: const Text('Distance Unity'),
                      isExpanded: true,
                      icon: const Icon(
                        Icons.expand_more,
                      ),
                      value: changeDropdownValue.dropdownValue2,
                      onChanged: (String? newValue1) {
                        changeDropdownValue.switchDropdownValue2(newValue1);
                      },
                      items: <String>['Km (Kilometer)', 'Mi (miles)']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 20),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: height * 0.015),
                    const Text(
                      '-------------------------------------------------------------------------------------------',
                      style: TextStyle(color: Colors.grey),
                    ),
                    // DropdownButton(
                    //   dropdownColor: Colors.white,
                    //   style: const TextStyle(
                    //     color: Colors.black,
                    //     backgroundColor: Colors.white,
                    //   ),
                    //   value: changeDropdownValue.dropdownValue3,
                    //   items: [
                    //     DropdownMenuItem(child: Text('English'), value: 'en',
                    //       onTap: ()=> AppModel.shared.changeLanguageToEn('en'),
                    //     ),
                    //     DropdownMenuItem(child: Text('العربية'), value: 'ar',
                    //       onTap: ()=> AppModel.shared.changeLanguageToAr('ar'),
                    //     ),
                    //   ],
                    //   onChanged: (String? newValue2) {
                    //     // newValue2 == changeDropdownValue.dropdownValue3
                    //     //     ? AppModel.shared.changeLanguage('en')
                    //     //     : AppModel.shared.changeLanguage('ar');
                    //     changeDropdownValue.switchDropdownValue3(newValue2);
                    //   },
                    // ),
                    SizedBox(height: height * 0.015),
                    GestureDetector(
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
                    SizedBox(height: height * 0.015),
                    GestureDetector(
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
                              child: const Text('Delete Account',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
    });
  }

  void _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(
      'EVSpots App',
      subject: "Link App",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}

// Future<bool> _getValue()async*{
//   Consumer<ChangeDropdownValue>(
//       builder: (_, changeDropdownValue, __) {
//         await  SharedPreference().getLanguage()?  changeDropdownValue.dropdownValueEN :  changeDropdownValue.dropdownValueAR;
//         return null;
//       });
// }
