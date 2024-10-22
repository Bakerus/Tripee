import 'package:get/get.dart';

import '../controllers/modified_publication_controller.dart';

class ModifiedPublicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModifiedPublicationController>(
      () => ModifiedPublicationController(),
    );
  }
}
