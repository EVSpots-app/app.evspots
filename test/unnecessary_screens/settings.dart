// import 'package:evspots/constans/shared_pref.dart';
// import 'package:evspots/screens/signin_screen.dart';
// import 'package:evspots/screens/vehicles.dart';
// import 'package:evspots/themes/app_color.dart';
// import 'package:evspots/widgets/AlertDialog.dart';
// import 'package:flutter/material.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';
// import '../generated/l10n.dart';
// import '../themes/theme_model.dart';
// import '../widgets/AppBar.dart';
// import '../widgets/languages.dart';
//
// class AppSettings2 extends StatefulWidget {
//   const AppSettings2({Key? key}) : super(key: key);
//
//   @override
//   State<AppSettings2> createState() => _AppSettings2State();
// }
//
// class _AppSettings2State extends State<AppSettings2> {
//   Future<PackageInfo> _getPackageInfo() {
//     return PackageInfo.fromPlatform();
//   }
//
//   TextEditingController _deleteAccount = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//
//     return Consumer<ThemeModel>(
//         builder: (context, ThemeModel themeNotifier, child) {
//           return Consumer<ChangeDropdownValue>(
//               builder: (_, changeDropdownValue, __) {
//                 return Scaffold(
//                   resizeToAvoidBottomInset: false,
//                   appBar: const MyAppBar(),
//                   body: Padding(
//
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(S.of(context).settings,
//                                     style: const TextStyle(
//                                         fontSize: 22, fontWeight: FontWeight.bold)),
//                                 IconButton(
//                                     onPressed: () {
//                                       _onShare(context);
//                                     },
//                                     icon: const Icon(Icons.share)),
//                               ],
//                             ),
//                             SizedBox(height: height * 0.01),
//                             const Text("set your preferences",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.grey)),
//                             SizedBox(height: height * 0.05),
//                             const Text("display_setting",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.grey)),
//                             SizedBox(height: height * 0.015),
//                             GestureDetector(
//                               onTap: () {
//                                 themeNotifier.isDark
//                                     ? themeNotifier.isDark = false
//                                     : themeNotifier.isDark = true;
//                               },
//                               child: Container(
//                                 width: width,
//                                 height: height * 0.06,
//                                 child: ListTile(
//                                   leading: Icon(
//                                     Icons.dark_mode_outlined,
//                                     color: themeNotifier.isDark
//                                         ? AppColor.mainColor
//                                         : AppColor.secColor,
//                                   ),
//                                   trailing: Icon(
//                                       themeNotifier.isDark
//                                           ? Icons.nightlight_round
//                                           : Icons.wb_sunny,
//                                       color: themeNotifier.isDark
//                                           ? Colors.white
//                                           : Colors.grey.shade900),
//                                   title: Text(S.of(context).darkMode,
//                                       style: const TextStyle(
//                                           fontSize: 22, fontWeight: FontWeight.bold)),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: height * 0.01),
//                             const Text("experience_an_excitiing_dark_mode",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.grey)),
//                             SizedBox(height: height * 0.06),
//                             const Text("Select Language",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.grey)),
//                             SizedBox(height: height * 0.01),
//                             GestureDetector(
//                               onTap: () async {
//                                 await showAlertDialog(
//                                   context: context,
//                                   title: S.of(context).selectLanguage,
//                                   content: 'Please Select Your Language',
//                                   actions: [
//                                     Languages(),
//                                     TextButton(
//                                       onPressed: () {
//                                         // SharedPreference().setLanguage();
//                                         Navigator.pop(context);
//                                       },
//                                       child: const Padding(
//                                         padding: EdgeInsets.all(8.0),
//                                         child: Text('Cancel'),
//                                       ),
//                                     ),
//                                   ], );
//                               },
//                               child: Container(
//                                 width: width,
//                                 height: height * 0.06,
//                                 color: Colors.transparent,
//                                 child: ListTile(
//                                   leading: Icon(
//                                     Icons.language,
//                                     color: themeNotifier.isDark
//                                         ? AppColor.mainColor
//                                         : AppColor.secColor,
//                                   ),
//                                   trailing: const Icon(Icons.expand_circle_down,
//                                       color: Colors.grey),
//                                   title: Text(S.of(context).selectLanguage,
//                                       style: const TextStyle(
//                                           fontSize: 22, fontWeight: FontWeight.bold)),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: height * 0.04),
//                             const Text('Distance Unity',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,)),
//                             // SizedBox(height: height * 0.008),
//                             DropdownButton(
//                               hint: Text('Distance Unity'),
//                               isExpanded: true,
//                               icon: const Icon(Icons.arrow_downward),
//                               value: changeDropdownValue.dropdownValue2,
//                               onChanged: (String? newValue) {
//                                 changeDropdownValue.switchDropdownValue(newValue);
//                               },
//                               items: <String>['Km (Kilometer)', 'Mm (Millimeters)', 'Cm (Centimeters)', 'M (Meters)']
//                                   .map<DropdownMenuItem<String>>((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(
//                                     value,
//                                     style: const TextStyle(fontSize: 20),
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                             SizedBox(height: height * 0.03),
//                           ],
//                         ),
//                         // SizedBox(height: height*0.4,),
//                         GestureDetector(
//                           onTap: () async {
//                             await showAlertDialog(
//                                 context: context,
//                                 title: 'LogOut',
//                                 content: 'Are you sure ?',
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       SharedPreference().deletePrefs();
//                                       Navigator.of(context).pushReplacement(
//                                           MaterialPageRoute(
//                                               builder: (context) => SignInScreen()));
//                                     },
//                                     child: const Padding(
//                                       padding: EdgeInsets.all(8.0),
//                                       child: Text('Continue'),
//                                     ),
//                                   ),
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: const Padding(
//                                       padding: EdgeInsets.all(8.0),
//                                       child: Text('Cancel'),
//                                     ),
//                                   ),
//                                 ]);
//                           },
//                           child: Container(
//                             width: width,
//                             height: height * 0.06,
//                             color: Colors.transparent,
//                             child: ListTile(
//                               trailing: const Icon(Icons.logout),
//                               title: Text(S.of(context).logout,
//                                   style: const TextStyle(
//                                       fontSize: 27, fontWeight: FontWeight.bold)),
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () async {
//                             await showAlertDialog(
//                                 context: context,
//                                 title: 'Delete Account',
//                                 content: 'Are you sure ? \nWrite "delete" if you sure ',
//                                 actions: [
//                                   TextField(
//                                     controller: _deleteAccount,
//                                   ),
//                                   TextButton(
//                                     onPressed: () {
//                                       _deleteAccount.text.toLowerCase() == 'delete'
//                                           ? Navigator.of(context).pushReplacement(
//                                           MaterialPageRoute(
//                                               builder: (context) => SignInScreen()))
//                                           : Navigator.pop(context);
//                                     },
//                                     child: const Padding(
//                                       padding: EdgeInsets.all(8.0),
//                                       child: Text('Continue'),
//                                     ),
//                                   ),
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: const Padding(
//                                       padding: EdgeInsets.all(8.0),
//                                       child: Text('Cancel'),
//                                     ),
//                                   ),
//                                 ]);
//                           },
//                           child: Container(
//                             width: width,
//                             height: height * 0.06,
//                             color: Colors.transparent,
//                             child: ListTile(
//                               trailing: const Icon(Icons.remove_circle),
//                               title: Text('Delete Account',
//                                   style: const TextStyle(
//                                       fontSize: 27, fontWeight: FontWeight.bold)),
//                             ),
//                           ),
//                         ),
//
//                         FutureBuilder<PackageInfo>(
//                           future: _getPackageInfo(),
//                           builder: (BuildContext context,
//                               AsyncSnapshot<PackageInfo> snapshot) {
//                             if (snapshot.hasError) {
//                               return const Text('ERROR');
//                             } else if (!snapshot.hasData) {
//                               return const Text('Loading...');
//                             }
//
//                             final data = snapshot.data!;
//
//                             return Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Text('App Naconst me: ${data.appName}',
//                                     style: const TextStyle(fontSize: 15)),
//                                 Text('Packconst age Name: ${data.packageName}',
//                                     style: const TextStyle(fontSize: 15)),
//                                 Text('Verconst sion: ${data.version}',
//                                     style: const TextStyle(fontSize: 15)),
//                                 Text('Build Number: ${data.buildNumber}',
//                                     style: const TextStyle(fontSize: 15)),
//                               ],
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               });
//         });
//   }
//
//   void _onShare(BuildContext context) async {
//     // A builder is used to retrieve the context immediately
//     // surrounding the ElevatedButton.
//     //
//     // The context's `findRenderObject` returns the first
//     // RenderObject in its descendent tree when it's not
//     // a RenderObjectWidget. The ElevatedButton's RenderObject
//     // has its position and size after it's built.
//     final box = context.findRenderObject() as RenderBox?;
//
//     await Share.share(
//       'EVSpots App',
//       subject: "Link App",
//       sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
//     );
//   }
// }
