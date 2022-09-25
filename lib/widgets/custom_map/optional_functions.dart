import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';
import '../../constants/app_fonts.dart';
import '../../constants/keys.dart';

///-----------------------------------NetWork IMage Custom Marker-----------------------------
// Future<Uint8List?> _loadNetworkImage(String path) async {
//   final completer = Completer<ImageInfo>();
//   var img = NetworkImage(path);
//   img
//       .resolve(const ImageConfiguration(size: Size.fromHeight(10)))
//       .addListener(
//       ImageStreamListener((info, _) => completer.complete(info)));
//   final imageInfo = await completer.future;
//   final byteData = await imageInfo.image.toByteData(
//     format: ui.ImageByteFormat.png,
//   );
//   return byteData?.buffer.asUint8List();
// }
//
// loadData2() async {
//   for (int i = 0; i < images.length; i++) {
//     Uint8List? image = await _loadNetworkImage(
//         'https://images.bitmoji.com/3d/avatar/201714142-99447061956_1-s5-v1.webp');
//
//     final ui.Codec markerImageCodec = await instantiateImageCodec(
//       image!.buffer.asUint8List(),
//       targetHeight: 200,
//       targetWidth: 200,
//     );
//     final FrameInfo frameInfo = await markerImageCodec.getNextFrame();
//     final ByteData? byteData = await frameInfo.image.toByteData(
//       format: ImageByteFormat.png,
//     );
//
//     final Uint8List resizedMarkerImageBytes = byteData!.buffer.asUint8List();
//     _marker.add(
//       Marker(
//         markerId: MarkerId(i.toString()),
//         position: _latLang[i],
//         icon: BitmapDescriptor.fromBytes(resizedMarkerImageBytes),
//         anchor: const Offset(.1, .1),
//         //icon: BitmapDescriptor.fromBytes(image!.buffer.asUint8List()),
//         infoWindow:
//         InfoWindow(title: 'This is title marker: ' + i.toString()),
//       ),
//     );
//     setState(() {});
//   }
// }

///---------------------------------Polygon-----------------------------------
// final Set<Polygon> _polygon = HashSet<Polygon>();
//
// void _setPolygon() {
//   _polygon.add(
//     Polygon(
//       polygonId: const PolygonId('1'),
//       points: _latLang,
//       strokeColor: AppColors.green,
//       strokeWidth: 5,
//       fillColor: AppColors.yellow,
//       geodesic: true,
//     ),
//   );
// }
///---------------------Custom Marker Image ------------------------------------
Future<Uint8List> getBytesFromAssets(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();

  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

///-----------------------------------search location---------------------------
Future<void> mapSearch({
  required BuildContext context,
  required TextEditingController searchController,
  required Completer<GoogleMapController> completer,
}) async {
  Prediction? p = await PlacesAutocomplete.show(
    context: context,
    apiKey: APIKeys.polyLinesApiKey,
    mode: Mode.fullscreen,
    language: 'en',
    strictbounds: false,
    types: [""],
    logo: const SizedBox(),
    components: [
      Component(Component.country, "jo"),
      Component(Component.country, "usa")
    ],
    decoration: InputDecoration(
      hintText: 'Tap to search',
      hintStyle: AppFont.style(
        color: AppColors.grey,
        fontFamily: 'PoppinsRegular',
        fontSize: Dimensions.w14,
      ),
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      border: InputBorder.none,
      suffixIcon: searchController.text.isNotEmpty
          ? IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                searchController.clear();
              },
            )
          : const SizedBox(),
    ),
    // overlayBorderRadius: BorderRadius.circular(20),
    onError: (PlacesAutocompleteResponse response) {
      print(response.errorMessage);
      Get.snackbar('Error', response.errorMessage.toString(),
          snackPosition: SnackPosition.TOP);
    },
  );
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: APIKeys.polyLinesApiKey);
  PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p!.placeId!);

  double lat = detail.result.geometry!.location.lat;
  double lng = detail.result.geometry!.location.lng;
  LatLng location = LatLng(lat, lng);

  CameraPosition _cameraPosition = CameraPosition(
    target: location,
    zoom: 16.5,
  );
  GoogleMapController controller = await completer.future;
  controller.animateCamera(
    CameraUpdate.newCameraPosition(_cameraPosition),
  );
}

///---------------------Calculate Distance------------------------------------
class DistanceService {
  static double findDistance(LatLng from, LatLng to) {
    var lat1 = toRadian(from.latitude);
    var lng1 = toRadian(from.longitude);
    var lat2 = toRadian(to.latitude);
    var lng2 = toRadian(to.longitude);

    // Haversine Formula
    double dLong = lng2 - lng1;
    double dLat = lat2 - lat1;

    double res = pow(sin((dLat / 2)), 2) +
        cos(lat1) * cos(lat2) * pow(sin(dLong / 2), 2);
    res = 2 * asin(sqrt(res));
    double R = 6371;
    res = res * R;

    return res;
  }

  static double toRadian(double val) {
    double oneDeg = (pi) / 180;
    return (oneDeg * val);
  }
}
