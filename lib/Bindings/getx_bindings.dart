import 'package:map_locations/Controllers/products_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataController(), permanent: true);
  }
}
