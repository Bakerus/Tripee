import 'package:get/get.dart';

import '../controllers/edit_expedition_controller.dart';

class EditExpeditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditExpeditionController>(
      () => EditExpeditionController(),
    );
  }
}
