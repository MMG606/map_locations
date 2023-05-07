// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_locations/Models/products.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  late ScrollController scrollController;
  var data_List = <Data>[].obs;
  var data_details = <Data>[].obs;
  List<Marker> markers = <Marker>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    // fetchloc();
    getMarkers();
  }

  Future fetchProducts() async {
    // String apiUrl =
    //     'http://platform.geovisiontechnologies.com:1005/GVMOBILERECRUITMENT/proxy.ashx?http://mohammadghalayini606@gmail.com';
    String apiUrl = 'https://mocki.io/v1/3cd45daf-6752-4186-a731-fcc0da8b0420';

    final response = await http.get(Uri.parse(apiUrl));

    final fetchedData = (json.decode(response.body));

    if (response.statusCode == 200) {
      data_List.clear();
      data_List.addAll(DataFromJson(fetchedData));
      print(fetchedData.length);
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Future fetchloc() async {
  //   markers = <Marker>[
  //     for (int i = 0; i < data_List.length; i++)
  //       Marker(
  //           markerId: MarkerId(i.toString()),
  //           position: LatLng(data_List[i].lat, data_List[i].lng),
  //           infoWindow: const InfoWindow(title: 'My Position')),
  //   ];
  // }

  getMarkers() {
    // Add this line. Create map view controller object
    // <======= Add
    //get markers from controller
    //var realdata = markers;

    //realdata.asMap().forEach((key, value)
    for (int i = 0; i < data_List.length; i++) {
      var marker = Marker(
          consumeTapEvents: true,
          markerId: MarkerId(i.toString()),
          position: LatLng(data_List[i].lat, data_List[i].lng),
          onTap: () {
            //do something here
          });

      markers.add(marker); // <===== Update
      update(); // <=== Add, because you are using GetBuilder
    }
  }
}
