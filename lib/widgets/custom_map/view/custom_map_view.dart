import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:evspots/widgets/custom_map/optional_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../home/map_screen/custom_scroll_view_content.dart';
import '../widget/custom_info_window_widget.dart';
import '../widget/map_center_marker.dart';
import '../widget/map_location_badge.dart';

final GlobalKey<ScaffoldState> ButtonSheet = GlobalKey();

class CustomMapView extends StatefulWidget {
  const CustomMapView({Key? key}) : super(key: key);

  @override
  State<CustomMapView> createState() => CustomMapViewState();
}

class CustomMapViewState extends State<CustomMapView> {
  final Completer<GoogleMapController> _completer = Completer();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  bool userBadgeSelected = false;

  final TextEditingController _searchController = TextEditingController();

  static const LatLng sourceLocation = LatLng(31.957940, 35.865360);
  static const LatLng destinationLocation = LatLng(31.958936, 35.866577);
  static const LatLng lastLocation = LatLng(31.957340, 35.866797);

  static const LatLng firstPin = LatLng(31.959935, 35.863575);
  static const LatLng secPin = LatLng(31.958641, 35.863575);
  static const LatLng th3Pin = LatLng(31.957440, 35.863610);
  static const LatLng for4Pin = LatLng(31.956204, 35.863653);


  static const double zoom = 16.5;

  List<String> images = [
    'assets/icons/ev_pin_map.png',
    'assets/icons/ev_pin_map.png',
    'assets/icons/ev_pin_map.png',
    'assets/icons/ev_pin_map.png',
    'assets/icons/ev_pin_map.png',
    'assets/icons/ev_pin_map.png',
    'assets/icons/ev_pin_map.png',

    // 'assets/icons/ev_pin_map.png',
    // 'assets/icons/ev_pin_map.png',
    // 'assets/images/car.jpg',
    // 'assets/images/scooter.jpg',
    // 'assets/images/car.jpg',
  ];

  final List<LatLng> _latLang = [
    sourceLocation,
    destinationLocation,
    lastLocation,
    firstPin,
    secPin,
    th3Pin,
    for4Pin
  ];

  static const _initialCameraPosition = CameraPosition(
    target: sourceLocation,
    zoom: zoom,
  );

  CameraPosition? _currentCameraPosition = const CameraPosition(
    target: sourceLocation,
    zoom: zoom,
    tilt: 0.0,
  );

  Position? _myCurrentLocation;

  String mapStyle = '';

  @override
  void initState() {
    ///Set initial location
    // setInitialLocation();
    //setUserCurrentLocationMarker();
    ///Custom Marker
    // showMarkersOnMap();
    super.initState();
  }

  MapType _currentMapType = MapType.normal;

  LatLng? _latLangCenterMarker = _initialCameraPosition.target;
  String address = 'Getting your address...';
  double distance = 0.0;

  @override
  Widget build(BuildContext context) {
    distance = DistanceService.findDistance(
        _latLangCenterMarker!, destinationLocation);
    return Scaffold(
      key: ButtonSheet,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: GestureDetector(
        //   child: TextField(
        //     controller: _searchController,
        //     cursorHeight: 25,
        //     autofocus: false,
        //     enabled: false,
        //     textAlign: TextAlign.start,
        //     cursorColor: Colors.green,
        //     style: TextStyle(
        //       color: Colors.black,
        //       //fontFamily: 'PoppinsRegular',
        //       fontSize: 14,
        //     ),
        //     decoration: InputDecoration(
        //       hintText: 'Tap to search',
        //       hintStyle: TextStyle(
        //         color: Colors.grey,
        //         // fontFamily: 'PoppinsRegular',
        //         fontSize: 14,
        //       ),
        //       contentPadding: EdgeInsets.only(
        //           left: 10,
        //           top: 10,
        //           bottom: 10),
        //       fillColor: Colors.white,
        //       filled: true,
        //       prefixIcon: IconButton(
        //         icon: const Icon(Icons.search_rounded),
        //         color: Colors.grey,
        //         onPressed: () {},
        //       ),
        //       border: const OutlineInputBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(25)),
        //         borderSide: BorderSide(
        //           width: 0,
        //           style: BorderStyle.none,
        //         ),
        //       ),
        //       suffixIcon: AnimatedSwitcher(
        //         duration: const Duration(microseconds: 300),
        //         child: _searchController.text.isNotEmpty
        //             ? IconButton(
        //                 icon: const Icon(Icons.clear),
        //                 onPressed: () {
        //                   _searchController.clear();
        //                 },
        //               )
        //             : const SizedBox(),
        //       ),
        //     ),
        //     onTap: () {},
        //   ),
        //   onTap: () {
        //     mapSearch(
        //       context: context,
        //       searchController: _searchController,
        //       completer: _completer,
        //     );
        //   },
        // ),
      ),
      body: Stack(
        alignment: const Alignment(0.0, 0.0),
        children: [
          Positioned(
            child: GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              mapType: _currentMapType,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              compassEnabled: false,
              myLocationEnabled: false,
              tiltGesturesEnabled: false,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              buildingsEnabled: true,
              indoorViewEnabled: false,
              mapToolbarEnabled: false,
              markers: Set<Marker>.of(_marker),
              polylines: _polyLines,
              //trafficEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _completer.complete(controller);

                ///move to current location when map created
                //setUserCurrentLocationMarker();

                ///set all markers on map
                showMarkersOnMap();

                ///set all poly lines on map
                //setPolyLines();

                ///set custom info window for markers
                _customInfoWindowController.googleMapController = controller;
                _latLangCenterMarker = _initialCameraPosition.target;
              },
              onTap: (position) {
                // ButtonSheet.currentState!.showBottomSheet((context) => DraggableScrollableSheet(
                //   initialChildSize: 0.30,
                //   minChildSize: 0.15,
                //   builder: (BuildContext context, ScrollController scrollController) {
                //     return SingleChildScrollView(
                //       controller: scrollController,
                //       child: CustomScrollViewContent(),
                //     );
                //   },
                // ),);
               _customInfoWindowController.hideInfoWindow!();
                userBadgeSelected = false;
                setState(() {});
              },
              onCameraMove: (position) {
                print(_latLang.length);
                // if (_marker.length == _latLang.length) {
                //   _marker.insert(
                //     _marker.length,
                //     Marker(
                //       // icon: BitmapDescriptor.fromBytes(markerIcon),
                //       icon: BitmapDescriptor.defaultMarker,
                //       markerId: const MarkerId('x'),
                //       position: position.target,
                //     ),
                //   );
                // } else {
                //   _marker.last =
                //       _marker.last.copyWith(positionParam: position.target);
                //   _latLangCenterMarker = _marker.last.position;
                // }

                _latLangCenterMarker = position.target;
                _customInfoWindowController.hideInfoWindow!();
                setState(() {});
              },
              onCameraIdle: () async {
                // if (_latLangCenterMarker != _initialCameraPosition.target) {
                await getAddressFromLatLong(_latLangCenterMarker!);
                // }
                setState(() {});
              },
            ),
          ),
          // MapLocationBadge(
          //   address: address,
          //   latLang: _latLangCenterMarker!,
          //   onTap: () {},
          //   // onTap: () => setUserCurrentLocationMarker(),
          // ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 250,
            offset: 35,
          ),
          const MapCenterMarker(),

          Positioned(
            bottom: 240,
            right: 20,
            // add your floating action button
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: _currentMapType == MapType.normal ? 1 : 0,
              child: SizedBox(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  heroTag: 'theme',
                  backgroundColor: mapStyle.isEmpty
                      ? Colors.blueGrey
                      : Colors.grey,
                  foregroundColor:
                      mapStyle.isEmpty ? Colors.black : Colors.white,
                  child: Icon(
                    Icons.dark_mode_outlined,
                    size: 20,
                  ),
                  onPressed: () {
                    _completer.future.then((value) {
                      DefaultAssetBundle.of(context)
                          .loadString('assets/images/map_theme.json')
                          .then((string) {
                        setState(() {});
                        value.setMapStyle(string);
                      });
                    }).catchError((error) {
                      debugPrint("error" + error.toString());
                    });

                    if (_currentMapType == MapType.normal) {
                      _completer.future.then(
                        (value) {
                          if (mapStyle.isEmpty) {
                            mapStyle = 'dark';
                            DefaultAssetBundle.of(context)
                                .loadString(
                                    'assets/images/map_theme.json')
                                .then((string) {
                              value.setMapStyle(string);
                            });
                          } else {
                            mapStyle = '';
                            DefaultAssetBundle.of(context)
                                .loadString('assets/images/map_style.json')
                                .then((string) {
                              value.setMapStyle(string);
                            });
                          }
                        },
                      );
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
          ), //DarkMode
          Positioned(
            bottom: 190,
            right: 20,
            // add your floating action button
            child: SizedBox(
              height: 40,
              width: 40,
              child: FloatingActionButton(
                heroTag: 'layers',
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: Icon(
                  Icons.layers_outlined,
                  size: 20,
                ),
                onPressed: () {
                  if (_currentMapType == MapType.normal) {
                    _currentMapType = MapType.satellite;
                  } else if (_currentMapType == MapType.satellite) {
                    _currentMapType = MapType.hybrid;
                  } else {
                    _currentMapType = MapType.normal;
                  }
                  setState(() {});
                },
              ),
            ),
          ), //MapType
          Positioned(
            bottom: 120,
            right: 15,
            child: FloatingActionButton(
              heroTag: 'myLocation',
              foregroundColor: Colors.white,
              child: Icon(
                _currentCameraPosition!.tilt == 0.0
                    ? Icons.location_searching_outlined
                    : CupertinoIcons.compass,
                size: 25,
              ),
              onPressed: () {
                setUserCurrentLocationMarker();
              },
            ),
          ), //currentLocation

          ///
          // Positioned(
          //   bottom: 20,
          //   right: 0,
          //   left: 0,
          //   child: Container(
          //     alignment: Alignment.center,
          //     height: 40,
          //     padding: EdgeInsets.symmetric(
          //         horizontal: 20, vertical: 5),
          //     margin: EdgeInsets.symmetric(horizontal:40),
          //     decoration: BoxDecoration(
          //       color: Colors.black87,
          //       borderRadius: BorderRadius.circular(40),
          //       border: Border.all(
          //         color: Colors.blueGrey,
          //       ),
          //     ),
          //     child: Text(
          //       formatDistance(distance),
          //       softWrap: true,
          //       style: TextStyle(
          //         color: Colors.green,
          //         fontSize: 16,
          //         // fontFamily: 'PoppinsRegular',
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Future getAddressFromLatLong(LatLng latLng) async {
    try {
      List<Placemark> placeMark =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

      address = placeMark.first.street! +
          ', ' +
          placeMark.first.subLocality! +
          ', ' +
          placeMark.first.administrativeArea! +
          ', ' +
          placeMark.first.country!;

      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('getAddressFromLatLong Error');
    }
  }

  ///---Get user current location and set his mark then change camera position-----

  Future setUserCurrentLocationMarker() async {
    getCurrentLocation().then(
      (value) async {
        _myCurrentLocation = value;
        debugPrint(value.latitude.toString());
        debugPrint(value.longitude.toString());

        // final Uint8List markerIcon =
        //     await getBytesFromAssets('assets/images/no-image.jpg', 100);
        // _marker.add(
        //   Marker(
        //     icon: BitmapDescriptor.fromBytes(markerIcon),
        //     markerId: const MarkerId("current"),
        //     infoWindow: const InfoWindow(title: 'My current location'),
        //     position: LatLng(value.latitude, value.longitude),
        //   ),
        // );
        setState(() {});
        if (_currentCameraPosition != null) {
          if (_currentCameraPosition!.tilt == 0.0) {
            _currentCameraPosition = CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: zoom,
              tilt: 50,
              bearing: -10,
            );
          } else {
            _currentCameraPosition = CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: zoom,
              tilt: 0.0,
            );
          }
        }

        GoogleMapController controller = await _completer.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(_currentCameraPosition!),
        );
      },
    );
  }

  Future<Position> getCurrentLocation() async {
    await Geolocator.requestPermission().then((value) {}).onError(
      (error, stackTrace) {
        debugPrint("error" + error.toString());
      },
    );
    return await Geolocator.getCurrentPosition();
  }

  ///-----------------------------------Custom Marker-----------------------------

  final List<Marker> _marker = [];

  void showMarkersOnMap() async {
    for (int i = 0; i < _latLang.length; i++) {
      final Uint8List markerIcon = await getBytesFromAssets(images[i], 150);
      _marker.add(
        Marker(
          icon: BitmapDescriptor.fromBytes(markerIcon),
          // icon: BitmapDescriptor.defaultMarker,
          markerId: MarkerId(i.toString()),
          position: _latLang[i],
          onTap: () {
            userBadgeSelected = true;
            _customInfoWindowController.addInfoWindow!(
              const CustomInfoWindowWidget(),
              _latLang[i],
            );
            setState(() {});
          },
        ),
      );

      // _polyLines.add(
      //   Polyline(
      //     polylineId: const PolylineId("route"),
      //     points: _latLang,
      //     color: AppColors.green,
      //     width: 5,
      //     jointType: JointType.round,
      //   ),
      // );
    }
  }

  ///-----------------------------------Polyline-----------------------------
  final Set<Polyline> _polyLines = HashSet<Polyline>();
  List<LatLng> firstPolylineCoordinates = [];
  List<LatLng> secondPolylineCoordinates = [];
  PolylinePoints? polylinePoints = PolylinePoints();

  void setPolyLines() async {
    PolylineResult firstLine = await polylinePoints!.getRouteBetweenCoordinates(
      'AIzaSyAk9gbAimjshbGAHWT9aaXZIWxVo3Ncp6o',
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destinationLocation.latitude, destinationLocation.longitude),
    );

    ///-------------------------------------------------------------------------
    PolylineResult secondLine =
        await polylinePoints!.getRouteBetweenCoordinates(
      'AIzaSyAk9gbAimjshbGAHWT9aaXZIWxVo3Ncp6o',
      PointLatLng(destinationLocation.latitude, destinationLocation.longitude),
      PointLatLng(lastLocation.latitude, lastLocation.longitude),
    );

    ///-------------------------------------------------------------------------
    if (firstLine.points.isNotEmpty && secondLine.points.isNotEmpty) {
      for (PointLatLng point in firstLine.points) {
        firstPolylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      _polyLines.add(
        Polyline(
          polylineId: const PolylineId('route'),
          width: 5.toInt(),
          color: Colors.green,
          points: firstPolylineCoordinates,
        ),
      );

      ///-----------------------------------------------------------------------
      for (PointLatLng point in secondLine.points) {
        secondPolylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      _polyLines.add(
        Polyline(
          polylineId: const PolylineId('route2'),
          width: 5.toInt(),
          color: Colors.red,
          points: secondPolylineCoordinates,
        ),
      );
      setState(() {});
    } else {
      debugPrint(firstLine.errorMessage);
    }
  }

  ///-----------------------------------initial location-----------------------------
// LatLng? currentLocation;
// LatLng? targetLocation;
//
// void setInitialLocation() {
//   currentLocation = LatLng(sourceLocation.latitude, sourceLocation.latitude);
//   targetLocation =
//       LatLng(destinationLocation.latitude, destinationLocation.latitude);
// }

  ///
  String formatDistance(double num) {
    if (num < 1) {
      return ((num * 1000).toInt()).toString() + ' m ';
    } else {
      return num.toStringAsFixed(2) + ' Km';
    }
  }
}
