import 'package:get/get.dart';

class CheckOrderController extends GetxController {
  final reservedplaces = 0.obs;
  final price = 0.0.obs;
  final totalAmount = 0.0.obs;
  final rideId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    calculateTotalAmount();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  calculateTotalAmount() {
    totalAmount.value = reservedplaces.value * price.value;
    print("yo");
  }
}
