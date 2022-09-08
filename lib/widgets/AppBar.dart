import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class MyAppBar extends StatefulWidget with PreferredSizeWidget{
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => Size.fromHeight(kToolbarHeight);


}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(S.of(context).evspots),
    );
  }
}
// appBar: AppBar(
//
//   backgroundColor: Colors.pink.shade400,
//
//   toolbarHeight: 100,
//
//   elevation: 14,
//
//   shape: RoundedRectangleBorder(
//
//       borderRadius:
//
//       BorderRadius.only(bottomRight: Radius.circular(70),bottomLeft: Radius.circular(70))
//
//   ),
//
//   title: Text('Let Me Flutter',),
//
//   actions: [
//
//     Row(
//
//       children: [
//
//         Container(
//
//           height: 40,width: 40,
//
//           alignment: Alignment.center,
//
//           decoration: BoxDecoration(
//
//               boxShadow: [
//
//                 BoxShadow(blurRadius: 7,spreadRadius: 3,
//
//                     color: Colors.pink
//
//                 )
//
//               ],
//
//               shape: BoxShape.circle,
//
//               color: Colors.pink.shade400
//
//           ),
//
//           child: Icon(Icons.search,size: 20,
//
//           ),
//
//         ),
//
//         SizedBox(width: 10,),
//
//         Container(
//
//           height: 40,width: 40,
//
//           alignment: Alignment.center,
//
//           decoration: BoxDecoration(
//
//               boxShadow: [
//
//                 BoxShadow(blurRadius: 7,spreadRadius: 3,
//
//                     color: Colors.pink
//
//                 )
//
//               ],
//
//               shape: BoxShape.circle,
//
//               color: Colors.pink.shade400
//
//           ),
//
//           child: Icon(Icons.notifications,size: 20,
//
//           ),
//
//         ),
//
//         SizedBox(width: 10,),  Container(
//
//           height: 40,width: 40,
//
//           alignment: Alignment.center,
//
//           decoration: BoxDecoration(
//
//               boxShadow: [
//
//                 BoxShadow(blurRadius: 7,spreadRadius: 3,
//
//                     color: Colors.pink
//
//                 )
//
//               ],
//
//               shape: BoxShape.circle,
//
//               color: Colors.pink.shade400
//
//           ),
//
//           child: Icon(Icons.logout,size: 20,
//
//           ),
//
//         ),
//
//         SizedBox(width: 26,)
//
//       ],
//
//     )
//
//   ],
//
// ),
