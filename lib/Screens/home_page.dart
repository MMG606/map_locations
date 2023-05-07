import 'package:flutter/material.dart';
import 'package:map_locations/Controllers/products_controller.dart';
import 'package:get/get.dart';

import '../widgets/list_view.dart';
import '../widgets/product_details.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            children: [
              ProductList(),
              if (dataController.data_details.isNotEmpty) ...[
                ProductDetails(),
              ] else ...[
                Container(
                  color: const Color.fromARGB(255, 223, 223, 223),
                  height: height * 0.6,
                  width: width,
                  child: const Center(
                    child: Text(
                      'Tap on one of the products above to view its details',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
