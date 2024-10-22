import 'package:get/get.dart';

import '../controllers/post_expedition_controller.dart';

class PostExpeditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostExpeditionController>(
      () => PostExpeditionController(),
    );
  }
}
