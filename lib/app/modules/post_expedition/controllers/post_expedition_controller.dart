import 'package:get/get.dart';

class PostExpeditionController extends GetxController {
  var expeditionsItems = [
    'Expéditeur',
    'Transporteur',
  ];
  final selectedItem = "Expéditeur".obs;

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

  void updateSelectedItem(String value) {
    selectedItem.value = value;
  }
}
