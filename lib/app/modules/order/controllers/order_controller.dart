import 'package:get/get.dart';

class OrderController extends GetxController {
  final bagages = ['Oui', 'Non'];
  final selectedBagages = "Oui".obs;
  var choosedValue = "Oui";
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
  void updateSelectedItem(String? value, RxString? selectedItem) {
    selectedItem!.value = value!;
    print("$selectedItem: selectedItem");
  }
}
