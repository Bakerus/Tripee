import 'package:get/get.dart';

class DashboardController extends GetxController {
  final selectedIndex = 0.obs;
  final previousIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
    previousIndex.value = selectedIndex.value;
  }
}
