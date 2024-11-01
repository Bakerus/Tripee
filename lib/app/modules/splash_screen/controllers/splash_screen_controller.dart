import 'package:get/get.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class SplashScreenController extends GetxController {
  var containerSize = 0.68.obs;
  var borderRadius = 200.0.obs;
  var bottomMargin = 40.0.obs;
  var rightMargin = 50.0.obs;
  final haveAccount = false.obs;

  @override
  void onInit() {
    super.onInit();
    verifiedStatuts();
    startAnimation();
  }

  void startAnimation() {
    Future.delayed(Duration.zero, () {
      // First animation (size reduction)
      containerSize.value = 0.62;
      bottomMargin.value = 0.0;
      rightMargin.value = 0.0;
    });

    Future.delayed(const Duration(seconds: 1), () {
      // Second animation (Increasing the size while keeping the circular shape)
      containerSize.value = 3;
      borderRadius.value = containerSize.value / 2;
    });
  }

  verifiedStatuts() async {
    var statut = await LocalFileServices().readFromFile();
    if (statut != null) {
      haveAccount.value = true;
    }
  }
}

/**
 * This file defines the `SplashScreenController` class, which is responsible for managing the splash screen animations 
 * and checking the account status during the app initialization process.
 * 
 * Main functionalities include:
 * 1. `onInit` - Called when the controller is initialized. It triggers the account status check and starts the animations.
 * 2. `startAnimation` - Manages two stages of animation:
 *    - The first stage reduces the size of a container while adjusting its margin to move it into position.
 *    - The second stage expands the container size beyond the screen, keeping it circular to simulate a splash effect.
 * 3. `verifiedStatuts` - Reads the local file to check if the user already has an account, updating the `haveAccount` status accordingly.
 * 
 * Key variables:
 * - `containerSize`, `borderRadius`, `bottomMargin`, `rightMargin`: Reactive variables controlling the size, radius, and margin of the animated container.
 * - `haveAccount`: A reactive boolean that tracks whether the user has an account based on data read from local storage.
 * 
 * The class utilizes `GetxController` to manage the state and reactivity using observables (`.obs`), ensuring smooth updates during animations.
 */
