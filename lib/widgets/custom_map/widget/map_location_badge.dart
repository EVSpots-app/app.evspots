
import 'package:flutter/material.dart';
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
      top: 110,
      left: 0,
      right: 0,
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 5, vertical: 5),
          margin: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: Colors.greenAccent,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/no-image.jpg'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Motasem Altamimi',
                      style: TextStyle(
                        fontSize: 14,
                        // fontFamily: 'PoppinsMedium',
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
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        //fontFamily: 'PoppinsRegular',
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.location_pin),
              SizedBox(width: 10),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
