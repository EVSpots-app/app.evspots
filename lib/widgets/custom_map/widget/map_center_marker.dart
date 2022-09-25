import 'package:courier/constants/app_colors.dart';
import 'package:courier/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class MapCenterMarker extends StatelessWidget {
  const MapCenterMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // top: (Dimensions.screenHeight) / 2.1,
      // child: Image.asset(
      //   'assets/icons/home/icon-map32.png',
      //   color: AppColors.green,
      //   frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
      //     return Transform.translate(
      //       offset: const Offset(8, -37),
      //       child: child,
      //     );
      //   },
      // ),
      child: Padding(
        padding: EdgeInsets.only(bottom: Dimensions.h45),
        child: Icon(
          Icons.location_pin,
          size: Dimensions.w50,
          color: AppColors.green,
        ),
      ),
    );
  }
}
