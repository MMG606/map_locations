import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/products_controller.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);
  final dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SizedBox(
        height: height * 0.3,
        child: Obx(
          () => ListView.builder(
              itemCount: dataController.data_List.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: width,
                  height: 50,
                  child: InkWell(
                    child: Text(
                      dataController.data_List[index].id.toString(),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      dataController.data_details.clear();
                      dataController.data_details
                          .add(dataController.data_List[index]);
                    },
                  ),
                );
              }),
        ));
  }
}
