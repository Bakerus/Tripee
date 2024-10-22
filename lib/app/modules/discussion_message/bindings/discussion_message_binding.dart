import 'package:get/get.dart';

import '../controllers/discussion_message_controller.dart';

class DiscussionMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscussionMessageController>(
      () => DiscussionMessageController(),
    );
  }
}
