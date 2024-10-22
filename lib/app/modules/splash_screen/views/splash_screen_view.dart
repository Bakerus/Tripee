import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/modules/onboardin_screen/bindings/onboardin_screen_binding.dart';
import 'package:tripee/app/modules/onboardin_screen/views/onboardin_screen_view.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Transition vers la page d'accueil après l'animation
    Future.delayed(const Duration(seconds: 6), () {
      NavigationHelper.navigateWithFadeWithoutBack(
          context.mounted ? context : context,
          OnboardinScreenBinding(),
          const OnboardinScreenView()); 
    });

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: Obx(() => AnimatedContainer(
                    duration: const Duration(seconds: 6),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    width: MediaQuery.of(context).size.width *
                        controller.containerSize.value,
                    height: MediaQuery.of(context).size.width *
                        controller.containerSize.value,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(193, 71, 2, 1),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 1),
                    ),
                  )),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut,
                      margin: EdgeInsets.only(
                        bottom: controller.bottomMargin.value,
                        right: controller.rightMargin.value,
                      ),
                      child: Image.asset(
                        "assets/images/voiture.png",
                        width: 100,
                      ),
                    )),
                const Text(
                  "Tripee",
                  style: TextStyle(
                    fontFamily: "Questrial",
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
