import 'package:get/get.dart';

class ConfirmOrderController extends GetxController {
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

  final nombrePlaces = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  final bagages = ['Oui', 'Non'];

  var choosedValue = "";

  final selectednombrePlaces = "1".obs;
  final selectedBagages = "Oui".obs;

  @override
  void onClose() {}
  void updateSelectedItem(String value, String selectedItem) {
    selectedItem = value;
  }
}
