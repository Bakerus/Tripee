import 'package:get/get.dart';

class PostActivityController extends GetxController {
  var selectedTabIndex = 0.obs; // Pour suivre l'index de l'onglet sélectionné

  void changeTabIndex(int index) {
    selectedTabIndex.value = index; // Mettre à jour l'index
  }

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
}
