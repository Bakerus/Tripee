import 'package:get/get.dart';

class UserAccountController extends GetxController {
  final currentStep = 1.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void nextStep() {
    if (currentStep.value != 2) {
      currentStep.value++;
      print("currentStep = ${currentStep.value}");
    }
  }

  void previousStep() {
    currentStep.value = 1;
    print("currentStep = ${currentStep.value}");
  }
}
