// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// class FirebaseRealTimeBD extends StatefulWidget {
//   const FirebaseRealTimeBD({Key? key}) : super(key: key);
//
//   @override
//   State<FirebaseRealTimeBD> createState() => _FirebaseRealTimeBDState();
// }
//
// class _FirebaseRealTimeBDState extends State<FirebaseRealTimeBD> {
//   int? temp = 0;
//   int? bpm = 0;
//   int? glucose = 0;
//   int? glucagon = 0;
//   int? insulin = 0;
//
//   @override
//   void initState() {
//     _readFirebaseData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'BPM $bpm',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               'Temp $temp',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               'Glucose $glucose',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               'Glucagon $glucagon',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               'Insulin $insulin',
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _readFirebaseData() async {
//     DatabaseReference ref = FirebaseDatabase.instance.ref("model001");
//     var data = await ref.get(); // get init data
//     if (data.exists) {
//       Map<dynamic, dynamic> myData = data.value as Map<dynamic, dynamic>;
//       // myData.putIfAbsent("Age", () => "25");
//       // myData.putIfAbsent("Ssn", () => "Hello");
//       // myData['Name'] = 'Ahmad';
//       // myData.putIfAbsent("AAA", () => 30);
//       // myData['Sedo']='Mohammad';
//       // ref.set(myData);
//       //
//       // Map<String, Object> myUpdatedMap = {};
//       // myData.forEach((key, value) {
//       //   myUpdatedMap.putIfAbsent(key.toString(), () => value);
//       // });
//       // await ref.update(myUpdatedMap);
//       //
//       // _fillData(myData);
//     } else {}
//     ref.onValue.listen((event) {
//       _fillData(event.snapshot.value as Map<dynamic, dynamic>);
//     });
//   }
//
//   void _fillData(Map<dynamic, dynamic> myData) {
//     if (myData['BPM'] != null) bpm = myData['BPM'];
//     if (myData['Temperature'] != null) temp = myData['Temperature'];
//     if (myData['Glucose'] != null) glucose = myData['Glucose'];
//     if (myData['Insulin'] != null) insulin = myData['Insulin'];
//     if (myData['Glucagon'] != null) glucagon = myData['Glucagon'];
//     if (mounted) setState(() {});
//   }
// }
