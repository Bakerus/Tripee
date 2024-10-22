import 'package:get/get.dart';

import '../controllers/editer_publication_controller.dart';

class EditerPublicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditerPublicationController>(
      () => EditerPublicationController(),
    );
  }
}
