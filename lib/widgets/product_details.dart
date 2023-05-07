import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:map_locations/Controllers/products_controller.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
  final dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 223, 223, 223),
        height: height * 0.6,
        width: width,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('id: ${dataController.data_details[0].id}'),
              Text('datetime: ${dataController.data_details[0].datetime}'),
              Text(
                'lat: ${dataController.data_details[0].lat}',
                textAlign: TextAlign.center,
              ),
              Text('lng: ${dataController.data_details[0].lng}\$'),
              Text('speed: ${dataController.data_details[0].speed}'),
              Text('heading: ${dataController.data_details[0].heading}'),
              Text('altitude: ${dataController.data_details[0].altitude}'),
              Text(
                  'batterylevel: ${dataController.data_details[0].batterylevel}'),
              Text(
                  'gpsaccuracy: ${dataController.data_details[0].gpsaccuracy}'),
              Text(
                  'numberofsatellites: ${dataController.data_details[0].numberofsatellites}'),
            ],
          ),
        ),
      ),
    );
  }
}
