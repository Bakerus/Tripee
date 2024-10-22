import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
 

  final otpState = false.obs;
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

  void updateOtpState() => otpState.value = true;
}
