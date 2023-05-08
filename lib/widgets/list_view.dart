import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_locations/Screens/map.dart';
import '../Controllers/data_controller.dart';

class DataList extends StatelessWidget {
  DataList({Key? key}) : super(key: key);
  final dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(actions: [
        //refresh data list button
        FilledButton(
            onPressed: () {
              dataController.RefreshData();
            },
            child: const Text(
              'Refresh data',
              style: TextStyle(color: Colors.white),
            )),
        //Sort data list button
        FilledButton(
            onPressed: () {
              Get.defaultDialog(
                  title: 'Sort By',
                  content: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                            dataController
                                .sortByBattery(dataController.data_List);
                          },
                          child: const Text('Battery level')),
                      TextButton(
                          onPressed: () {
                            Get.back();
                            dataController.sortbyID(dataController.data_List);
                          },
                          child: const Text('ID')),
                    ],
                  ));
            },
            child: const Text(
              'Sort',
              style: TextStyle(color: Colors.white),
            )),
      ]),
      body: Obx(
        () => Column(
          children: [
            if (dataController.data_List.isNotEmpty) ...[
              Expanded(
                child: GridView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 250),
                    itemCount: dataController.data_List.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID: ${dataController.data_List[index].id}'),
                              Text(
                                  'Datetime: ${dataController.data_List[index].datetime}'),
                              Text(
                                'Lat: ${dataController.data_List[index].lat}',
                              ),
                              Text(
                                  'Lng: ${dataController.data_List[index].lng}'),
                              Text(
                                  'Speed: ${dataController.data_List[index].speed}'),
                              Text(
                                  'Heading: ${dataController.data_List[index].heading}'),
                              Text(
                                  'Altitude: ${dataController.data_List[index].altitude}'),
                              Text(
                                  'Batterylevel: ${dataController.data_List[index].batterylevel}'),
                              Text(
                                  'Gpsaccuracy: ${dataController.data_List[index].gpsaccuracy}'),
                              Text(
                                  'Numberofsatellites: ${dataController.data_List[index].numberofsatellites}'),
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.back();
                          goToTheLake(dataController.data_List[index].lat,
                              dataController.data_List[index].lng);
                        },
                      );
                    }),
              ),
            ] else ...[
              //If the data failed to be fetched and the list is empty display this messege
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Somthing went wrong"),
                      Text("Press the refresh button to retry"),
                    ],
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
