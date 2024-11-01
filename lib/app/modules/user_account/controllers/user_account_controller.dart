import 'dart:convert';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class UserAccountController extends GetxController {
  final currentStep = 1.obs;
  final imagePath = "".obs;
  final username = "".obs;
  final userId = "".obs;
  Map<String, dynamic>? userInfo;

  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
    username.value = userInfo!["username"];
    userId.value = userInfo!["userId"];
  }

  void nextStep() {
    if (currentStep.value != 2) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 1) {
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

  Future<Map<String, dynamic>?> readUserInformations() async {
    final jsonString = await LocalFileServices().readFromFile();
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }
}

/*
- `currentStep`, `imagePath`, and `username` are observable variables, where `currentStep` tracks the current progress page, `imagePath` holds the selected image path, and `username` stores the user’s name.
- The `onInit()` method initializes the controller by reading user information and setting the `username` value. This method is called when the controller is initialized.
- `nextStep()` increments the `currentStep` to progress forward in the steps(to go to the next page), only allowing a maximum step of 2.
- `previousStep()` decrements the `currentStep` to move backward in steps, ensuring it doesn't go below 1.
- `getImage()` utilizes the `ImagePicker` to select an image from the gallery, assigning the selected image's path to `imagePath`.
- `readUserInformations()` asynchronously reads user information from a local file. It decodes the JSON string and returns a `Map` if successful; otherwise, it returns null.
*/