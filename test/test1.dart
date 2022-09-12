

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "ListView.builder",
        theme: ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        // home : new ListViewBuilder(), NO Need To Use Unnecessary New Keyword
        home: const ListViewBuilder());
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.list),
                trailing: const Text(
                  "GFG",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("List item $index"));
          }),
    );
  }
}




















// import 'package:flutter/material.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   static final title = 'salomon_bottom_bar';
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   var _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: MyApp.title,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(MyApp.title),
//         ),
//         bottomNavigationBar: SalomonBottomBar(
//           currentIndex: _currentIndex,
//           onTap: (i) => setState(() => _currentIndex = i),
//           items: [
//             /// Home
//             SalomonBottomBarItem(
//               icon: Icon(Icons.home),
//               title: Text("Home"),
//               selectedColor: Colors.purple,
//             ),
//
//             /// Likes
//             SalomonBottomBarItem(
//               icon: Icon(Icons.favorite_border),
//               title: Text("Likes"),
//               selectedColor: Colors.pink,
//             ),
//
//             /// Search
//             SalomonBottomBarItem(
//               icon: Icon(Icons.search),
//               title: Text("Search"),
//               selectedColor: Colors.orange,
//             ),
//
//             /// Profile
//             SalomonBottomBarItem(
//               icon: Icon(Icons.person),
//               title: Text("Profile"),
//               selectedColor: Colors.teal,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
// // // Copyright 2017 The Chromium Authors. All rights reserved.
// // // Use of this source code is governed by a BSD-style license that can be
// // // found in the LICENSE file.
// //
// // // ignore_for_file: public_member_api_docs
// //
// // import 'dart:async';
// //
// // import 'package:flutter/material.dart';
// // import 'package:package_info_plus/package_info_plus.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'PackageInfo Demo',
// //       theme: ThemeData(primarySwatch: Colors.blue),
// //       home: const MyHomePage(title: 'PackageInfo example app'),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({Key? key, this.title}) : super(key: key);
// //
// //   final String? title;
// //
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   PackageInfo _packageInfo = PackageInfo(
// //     appName: 'Unknown',
// //     packageName: 'Unknown',
// //     version: 'Unknown',
// //     buildNumber: 'Unknown',
// //     buildSignature: 'Unknown',
// //   );
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _initPackageInfo();
// //   }
// //
// //   Future<void> _initPackageInfo() async {
// //     final info = await PackageInfo.fromPlatform();
// //     setState(() {
// //       _packageInfo = info;
// //     });
// //   }
// //
// //   Widget _infoTile(String title, String subtitle) {
// //     return ListTile(
// //       title: Text(title),
// //       subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title!),
// //       ),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: <Widget>[
// //           _infoTile('App name', _packageInfo.appName),
// //           _infoTile('Package name', _packageInfo.packageName),
// //           _infoTile('App version', _packageInfo.version),
// //           _infoTile('Build number', _packageInfo.buildNumber),
// //           _infoTile('Build signature', _packageInfo.buildSignature),
// //         ],
// //       ),
// //     );
// //   }
// // }