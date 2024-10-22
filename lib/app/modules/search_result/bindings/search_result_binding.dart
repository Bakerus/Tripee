import 'package:get/get.dart';

import '../controllers/search_result_controller.dart';

class SearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchResultController>(
      () => SearchResultController(),
    );
  }
}
