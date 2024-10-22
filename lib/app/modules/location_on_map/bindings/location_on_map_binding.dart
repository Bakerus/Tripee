import 'package:get/get.dart';

import '../controllers/location_on_map_controller.dart';

class LocationOnMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationOnMapController>(
      () => LocationOnMapController(),
    );
  }
}
