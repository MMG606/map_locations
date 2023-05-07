// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:giblox_mobile_app/controllers/userdata_controller.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class map extends StatefulWidget {
//   const map({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// final userController = Get.put(UserController());
// var latitude = userController.user_latitude != null
//     ? double.parse(userController.user_latitude)
//     : 33.896658;
// var longitude = userController.user_longitude != null
//     ? double.parse(userController.user_latitude)
//     : 35.483385;

// class _HomePageState extends State<map> {
//   Completer<GoogleMapController> _controller = Completer();

// // on below line we have specified camera position
//   static final CameraPosition _kGoogle = CameraPosition(
//     target: LatLng(latitude, longitude),
//     zoom: 14.4746,
//   );
//   // Map<MarkerId, Marker> markers =
//   //     <MarkerId, Marker>{}; //-------------------------------test---------------
// // on below line we have created the list of markers
//   final List<Marker> _markers = <Marker>[
//     Marker(
//         markerId: MarkerId('1'),
//         position: LatLng(latitude, longitude),
//         infoWindow: InfoWindow(
//           title: 'My Position',
//         )),
//   ];

// // created method for getting user current location
//   // Future<Position> getUserCurrentLocation() async {
//   //   // bool serviceEnabled;
//   //   // LocationPermission permission;
//   //   await Geolocator.requestPermission()
//   //       .then((value) {})
//   //       .onError((error, stackTrace) async {
//   //     await Geolocator.requestPermission();
//   //     print("ERROR" + error.toString());
//   //   });
//   //   return await Geolocator.getCurrentPosition();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: (Icon(
//             Icons.arrow_back_ios_rounded,
//             size: 30,
//             color: Colors.orange,
//           )),
//         ),
//         backgroundColor: Color.fromARGB(
//             168, 255, 255, 255), // on below line we have given title of app
//       ),
//       body: Container(
//         child: SafeArea(
//           // on below line creating google maps
//           child: GoogleMap(
//             onTap: (latlang) {
//               _addMarkerLongPressed(
//                   latlang); //--------------------------test----------------------------
//             },
//             // on below line setting camera position
//             initialCameraPosition: _kGoogle,
//             // zoomGesturesEnabled: false,
//             // zoomControlsEnabled: false,
//             buildingsEnabled: false,
//             minMaxZoomPreference: MinMaxZoomPreference(13, 19),
//             // on below line we are setting markers on the map
//             markers: Set<Marker>.of(_markers),
//             // markers: Set<Marker>.of(markers.values),
//             // on below line specifying map type.
//             mapType: MapType.normal,
//             // on below line setting user location enabled.
//             myLocationEnabled: false,
//             // on below line setting compass enabled.
//             compassEnabled: true,
//             // on below line specifying controller on map complete.
//             onMapCreated: (GoogleMapController controller) {
//               _controller.complete(controller);
//             },
//           ),
//         ),
//       ),
//       // on pressing floating action button the camera will take to user current location
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             margin: EdgeInsets.only(bottom: 10),
//             child: FloatingActionButton.extended(
//               heroTag: '1',
//               backgroundColor: Colors.orange,
//               onPressed: () async {},
//               label: Container(
//                   child: Row(
//                 children: [
//                   Text('Get my Location'),
//                   Icon(Icons.pin_drop_rounded)
//                 ],
//               )),
//             ),
//           ),
//           if (userController.user_latitude != 0) ...[
//             Container(
//               margin: EdgeInsets.only(bottom: 10, left: 5),
//               child: FloatingActionButton.extended(
//                 heroTag: '2',
//                 backgroundColor: Colors.white,
//                 onPressed: () {
//                   print(latitude);
//                   print(longitude);
//                   print('=');
//                   print(userController.user_latitude);
//                   print(userController.user_longitude);
//                   Get.back();
//                 },
//                 label: Container(
//                     child: Text(
//                   'Done',
//                   style: TextStyle(color: Colors.orange),
//                 )),
//               ),
//             ),
//           ]
//         ],
//       ),
//     );
//   }
// }
