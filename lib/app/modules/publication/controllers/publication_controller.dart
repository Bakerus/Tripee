import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PublicationController extends GetxController {
  var currentStep = 1.obs;
  final imagePath = "".obs;
  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;
  final nombrePlaces = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  final bagages = ['Oui', 'Non'];
  final colis = ['Oui', 'Non'];
  var choosedValue = "";

  final selectednombrePlaces = "1".obs;
  final selectedBagages = "Oui".obs;
  final selectedColis = "Oui".obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}
  void updateSelectedItem(String? value, RxString? selectedItem) {
    selectedItem!.value = value!;
    print("$selectedItem: selectedItem");
  }

  void nextStep() {
    if (currentStep < 2) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep > 1) {
      currentStep.value--;
    }
  }

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}
