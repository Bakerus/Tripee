import 'package:get/get.dart';

import '../controllers/expedition_controller.dart';

class ExpeditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpeditionController>(
      () => ExpeditionController(),
    );
  }
}
