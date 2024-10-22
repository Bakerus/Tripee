import 'package:get/get.dart';

import '../controllers/post_activity_controller.dart';

class PostActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostActivityController>(
      () => PostActivityController(),
    );
  }
}
