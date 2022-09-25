import 'package:courier/constants/app_colors.dart';
import 'package:courier/constants/app_dimensions.dart';
import 'package:courier/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLocationBadge extends StatelessWidget {
  final String address;
  final LatLng latLang;
  final Function() onTap;

  const MapLocationBadge({
    Key? key,
    required this.onTap,
    required this.latLang,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimensions.h110,
      left: 0,
      right: 0,
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.w5, vertical: Dimensions.h5),
          margin: EdgeInsets.symmetric(horizontal: Dimensions.w40),
          decoration: BoxDecoration(
            color: AppColors.greyBackground,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: AppColors.offGrey,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/basket/Courier.png'),
              ),
              SizedBox(width: Dimensions.w10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Khaled Waled',
                      style: AppFont.style(
                        fontSize: Dimensions.w14,
                        fontFamily: 'PoppinsMedium',
                      ),
                    ),
                    // Text(
                    //   latLang.toString(),
                    //   style: AppFont.style(
                    //     fontSize: Dimensions.w12,
                    //     fontFamily: 'PoppinsRegular',
                    //   ),
                    // ),
                    Text(
                      address,
                      softWrap: true,
                      maxLines: 10,
                      style: AppFont.style(
                        color: AppColors.green,
                        fontSize: Dimensions.w12,
                        fontFamily: 'PoppinsRegular',
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.location_pin),
              SizedBox(width: Dimensions.w10),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
