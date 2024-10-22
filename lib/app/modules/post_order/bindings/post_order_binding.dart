import 'package:get/get.dart';

import '../controllers/post_order_controller.dart';

class PostOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostOrderController>(
      () => PostOrderController(),
    );
  }
}
