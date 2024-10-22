import 'package:get/get.dart';

import '../controllers/recipe_payment_controller.dart';

class RecipePaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecipePaymentController>(
      () => RecipePaymentController(),
    );
  }
}
