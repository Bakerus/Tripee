import 'package:get/get.dart';

import '../controllers/onboardin_screen_controller.dart';

class OnboardinScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardinScreenController>(() => OnboardinScreenController());
  }
}
