import 'package:get/get.dart';

class DashboardController extends GetxController {
  final selectedIndex = 0.obs;
  final previousIndex = 0.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void onItemTapped(int index) {
    selectedIndex.value = index;
    previousIndex.value = selectedIndex.value;
  }
}
