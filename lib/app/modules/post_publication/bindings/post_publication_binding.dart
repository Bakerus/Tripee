import 'package:get/get.dart';

import '../controllers/post_publication_controller.dart';

class PostPublicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostPublicationController>(
      () => PostPublicationController(),
    );
  }
}
