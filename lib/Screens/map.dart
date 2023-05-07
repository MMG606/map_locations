import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_locations/Controllers/products_controller.dart';
import 'package:get/get.dart';

final dataController = Get.put(DataController());

final Completer<GoogleMapController> _controller =
    Completer<GoogleMapController>();
CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(
      dataController.data_List.isNotEmpty
          ? dataController.data_List[1].lat
          : 59.440717697143555,
      dataController.data_List.isNotEmpty
          ? dataController.data_List[1].lng
          : 59.440717697143555),
  zoom: 2.4746,
);

CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(
        dataController.data_List[1].lat, dataController.data_List[1].lng),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414);

class HomePage2 extends StatelessWidget {
  HomePage2({Key? key}) : super(key: key);
  // final dataController = Get.put(DataController());
  // final List<Marker> _markers = <Marker>[
  //   for (int i = 0; i < dataController.data_List.length; i++)
  //     Marker(
  //         markerId: MarkerId(i.toString()),
  //         position: LatLng(
  //             dataController.data_List[i].lat, dataController.data_List[i].lng),
  //         infoWindow: const InfoWindow(title: 'My Position')),
  // ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    //dataController.fetchloc();
    dataController.getMarkers();
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: Obx(
            //use getx builder
            () => GoogleMap(
              mapType: MapType.normal,
              markers: Set<Marker>.of(dataController.markers),
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ),
        floatingActionButton: const FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: Text('To the lake!'),
          icon: Icon(Icons.directions_boat),
        ),
      ),
    );
  }
}

Future<void> _goToTheLake() async {
  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
}
