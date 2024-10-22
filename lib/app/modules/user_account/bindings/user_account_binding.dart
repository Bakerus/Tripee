import 'package:get/get.dart';

import '../controllers/user_account_controller.dart';

class UserAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAccountController>(
      () => UserAccountController(),
    );
  }
}
