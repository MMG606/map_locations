import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_locations/Models/products.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:map_locations/Screens/map.dart';

class DataController extends GetxController {
  late ScrollController scrollController;
  var data_List = <Data>[].obs;
  var data_details = <Data>[].obs;
  List<Marker> markers = <Marker>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
    getMarkers();
  }

  Future fetchData() async {
    try {
      String apiUrl =
          'http://platform.geovisiontechnologies.com:1005/GVMOBILERECRUITMENT/proxy.ashx?http://mohammadghalayini606@gmail.com';

      final response = await http.get(Uri.parse(apiUrl));

      final fetchedData = (json.decode(response.body));

      if (response.statusCode == 200) {
        data_List.clear();
        data_List.addAll(DataFromJson(fetchedData));
        getMarkers();
        //Get.to(HomePage());
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      //if the fetch failed a pop up messege will appear with a retry button
      Get.defaultDialog(
          title: 'Failed to fetch Map data',
          content: ElevatedButton(
              onPressed: () => {Get.back(), fetchData()},
              child: const Text('Retry')));
    }
  }

//refresh data list
  Future RefreshData() async {
    try {
      String apiUrl =
          'http://platform.geovisiontechnologies.com:1005/GVMOBILERECRUITMENT/proxy.ashx?http://mohammadghalayini606@gmail.com';

      final response = await http.get(Uri.parse(apiUrl));

      final fetchedData = (json.decode(response.body));

      if (response.statusCode == 200) {
        data_List.clear();
        data_List.addAll(DataFromJson(fetchedData));
        getMarkers();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      //if the fetch failed a pop up messege will appear with a retry button
      Get.defaultDialog(
          title: 'Failed to fetch Map data',
          content: ElevatedButton(
              onPressed: () => {Get.back(), fetchData()},
              child: const Text('Retry')));
    }
  }

// create marker from the fetched data
  getMarkers() {
    for (int i = 0; i < data_List.length; i++) {
      var marker = Marker(
          consumeTapEvents: true,
          markerId: MarkerId(i.toString()),
          position: LatLng(data_List[i].lat, data_List[i].lng),
          onTap: () {
            goToTheLake(data_List[i].lat, data_List[i].lng);
            Get.defaultDialog(
                title: 'Marker ${i.toString()}',
                content: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text('id: ${data_List[i].id}'),
                      Text('datetime: ${data_List[i].datetime}'),
                      Text(
                        'lat: ${data_List[i].lat}',
                        textAlign: TextAlign.center,
                      ),
                      Text('lng: ${data_List[i].lng}'),
                      Text('speed: ${data_List[i].speed}'),
                      Text('heading: ${data_List[i].heading}'),
                      Text('altitude: ${data_List[i].altitude}'),
                      Text('batterylevel: ${data_List[i].batterylevel}'),
                      Text('gpsaccuracy: ${data_List[i].gpsaccuracy}'),
                      Text(
                          'numberofsatellites: ${data_List[i].numberofsatellites}'),
                    ],
                  ),
                ));
          });

      markers.add(marker); //Update markers positions
      update();
    }
  }

//Sort data list by battery level
  List<Data> sortByBattery(List<Data> data_List) {
    data_List.sort((a, b) => a.batterylevel.compareTo(b.batterylevel));
    return data_List;
  }

//Sort data list by id
  List<Data> sortbyID(List<Data> data_List) {
    data_List.sort((a, b) => a.id.compareTo(b.id));
    return data_List;
  }
}
