import 'package:map_locations/Controllers/data_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataController(), permanent: true);
  }
}
