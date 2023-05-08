import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_locations/Controllers/data_controller.dart';
import 'package:get/get.dart';
import 'package:map_locations/widgets/list_view.dart';

final dataController = Get.put(DataController());

final Completer<GoogleMapController> _controller =
    Completer<GoogleMapController>();

//Default position of the map on start up
CameraPosition _kGooglePlex = const CameraPosition(
  target: LatLng(33.896658, 35.483385),
  zoom: 10.4746,
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Map'),
          actions: [
            FilledButton(
                onPressed: () {
                  Get.to(DataList());
                },
                child: const Text(
                  'Markers List',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: GetBuilder<DataController>(
          builder: (builder) => GoogleMap(
            mapType: MapType.normal,
            markers: Set<Marker>.of(dataController.markers),
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ),
    );
  }
}

//Move the camera to the selected marker with animation
Future<void> goToTheLake(double lat, lan) async {
  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(lat, lan),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414)));
}
