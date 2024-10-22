import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  var containerSize = 0.68.obs;
  var borderRadius = 200.0.obs;
  var bottomMargin = 40.0.obs;
  var rightMargin = 50.0.obs;

  @override
  void onInit() {
    super.onInit();
    startAnimation();
  }

  void startAnimation() {
    // Première animation (réduction des tailles)
    Future.delayed(Duration.zero, () {
      containerSize.value = 0.62;
      bottomMargin.value = 0.0;
      rightMargin.value = 0.0;
    });

    // Deuxième animation (agrandissement du cercle en gardant la forme circulaire pour dépasser l'écran)
    Future.delayed(const Duration(seconds: 3), () {
      containerSize.value = 3;
      borderRadius.value = containerSize.value / 2;
    });
  }
}
