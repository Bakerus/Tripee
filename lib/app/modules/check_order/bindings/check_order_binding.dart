import 'package:get/get.dart';

import '../controllers/check_order_controller.dart';

class CheckOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOrderController>(
      () => CheckOrderController(),
    );
  }
}
