import 'package:get/get.dart';

import '../controllers/recipe_message_controller.dart';

class RecipeMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecipeMessageController>(
      () => RecipeMessageController(),
    );
  }
}
