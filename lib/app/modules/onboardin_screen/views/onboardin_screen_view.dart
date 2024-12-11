import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/modules/login/bindings/login_binding.dart';
import 'package:tripee/app/modules/login/views/login_view.dart';
import '../controllers/onboardin_screen_controller.dart';

class OnboardinScreenView extends GetView<OnboardinScreenController> {
  const OnboardinScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 900),
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    // Animation pour l'élément actuel sortant
                    final oldOffsetAnimation = Tween<Offset>(
                      begin: const Offset(-1, 0),
                      end: Offset.zero, // Sort vers la gauche
                    ).animate(animation);

                    // Animation pour le nouvel élément entrant
                    final newOffsetAnimation = Tween<Offset>(
                      begin: const Offset(1, 0), // Entre par la droite
                      end: Offset.zero,
                    ).animate(animation);

                    return SlideTransition(
                      position: child.key ==
                              ValueKey<int>(controller.currentpage.value)
                          ? newOffsetAnimation // Si c'est le nouvel élément, il arrive par la droite
                          : oldOffsetAnimation, // Si c'est l'ancien élément, il sort par la gauche
                      child: child,
                    );
                  },
                  child: Image.asset(
                    width: 100.0.wp,
                    controller.onboardData[controller.currentpage.value].image,
                    key: ValueKey<int>(controller.currentpage.value),
                    fit: BoxFit.cover,
                  ),
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 5.0.wp, right: 5.0.wp, top: 2.0.hp, bottom: 1.0.hp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < controller.onboardData.length; i++)
                          Obx(
                            () => _buildIndicator(
                                i == controller.currentpage.value),
                          )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 9.0.hp),
                      height: 34.0.hp,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Obx(() => AnimatedSwitcher(
                                duration: const Duration(milliseconds: 900),
                                switchInCurve: Curves.easeInOut,
                                switchOutCurve: Curves.easeInOut,
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  final oldOffsetAnimation = Tween<Offset>(
                                    begin: const Offset(-1, 0),
                                    end: Offset.zero,
                                  ).animate(animation);

                                  final newOffsetAnimation = Tween<Offset>(
                                    begin: const Offset(1, 0),
                                    end: Offset.zero,
                                  ).animate(animation);

                                  final marginAnimation = Tween<double>(
                                    begin: 0.0,
                                    end: 30.0,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeInOut,
                                    ),
                                  );

                                  return SlideTransition(
                                    position: child.key ==
                                            ValueKey<int>(
                                                controller.currentpage.value)
                                        ? newOffsetAnimation
                                        : oldOffsetAnimation,
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            right: marginAnimation.value),
                                        child: child),
                                  );
                                },
                                child: Text(
                                  textAlign: TextAlign.justify,
                                  controller
                                      .onboardData[controller.currentpage.value]
                                      .title,
                                  key: ValueKey<int>(
                                      controller.currentpage.value),
                                  style:
                                      Apptheme.ligthTheme.textTheme.titleLarge,
                                ),
                              )),
                          Obx(() => AnimatedSwitcher(
                                duration: const Duration(milliseconds: 900),
                                switchInCurve: Curves.easeInOut,
                                switchOutCurve: Curves.easeInOut,
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  final oldOffsetAnimation = Tween<Offset>(
                                    begin: const Offset(-1, 0),
                                    end: Offset.zero,
                                  ).animate(animation);

                                  final newOffsetAnimation = Tween<Offset>(
                                    begin: const Offset(1, 0),
                                    end: Offset.zero,
                                  ).animate(animation);

                                  //animation des marges entre les elements qui switch
                                  final marginAnimation = Tween<double>(
                                    begin: 0.0, // Marge initiale
                                    end: 5.0, // Marge maximale
                                  ).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeInOut,
                                    ),
                                  );

                                  return SlideTransition(
                                    position: child.key ==
                                            ValueKey<int>(
                                                controller.currentpage.value)
                                        ? newOffsetAnimation
                                        : oldOffsetAnimation,
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            right: marginAnimation.value),
                                        child: child),
                                  );
                                },
                                child: Text(
                                  controller
                                      .onboardData[controller.currentpage.value]
                                      .description,
                                  key: ValueKey<int>(
                                      controller.currentpage.value),
                                  style: Apptheme
                                      .ligthTheme.textTheme.displayLarge,
                                ),
                              )),
                          Obx(() => AnimatedSwitcher(
                                duration: const Duration(milliseconds: 900),
                                switchInCurve: Curves.easeInOut,
                                switchOutCurve: Curves.easeInOut,
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  final oldOffsetAnimation = Tween<Offset>(
                                    begin: const Offset(-1, 0),
                                    end: Offset.zero,
                                  ).animate(animation);

                                  final newOffsetAnimation = Tween<Offset>(
                                    begin: const Offset(1, 0),
                                    end: Offset.zero,
                                  ).animate(animation);

                                  //animation des marges entre les elements qui switch
                                  final marginAnimation = Tween<double>(
                                    begin: 0.0, // Marge initiale
                                    end: 10.0, // Marge maximale
                                  ).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves
                                          .easeInOut, // Courbe d'animation rebondissante
                                    ),
                                  );

                                  return SlideTransition(
                                    position: child.key ==
                                            ValueKey<int>(
                                                controller.currentpage.value)
                                        ? newOffsetAnimation
                                        : oldOffsetAnimation,
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            right: marginAnimation.value),
                                        child: child),
                                  );
                                },
                                child: Text(
                                  controller
                                      .onboardData[controller.currentpage.value]
                                      .arguments,
                                  key: ValueKey<int>(
                                      controller.currentpage.value),
                                  style:
                                      Apptheme.ligthTheme.textTheme.bodyMedium,
                                  textAlign: TextAlign.justify,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 43.0.wp,
                            child: Obx(
                              () => ElevatedButton(
                                  onPressed: () {
                                    if (controller.currentpage.value == 0) {
                                      NavigationHelper
                                          .navigateWithFadeInWithoutBack(
                                              context,
                                              LoginBinding(),
                                              const LoginView());
                                    } else {
                                      controller.goPreviousPage();
                                    }
                                  },
                                  child: Text(
                                    controller.currentpage.value == 0
                                        ? "Passer"
                                        : "Precedent",
                                    style: const TextStyle(
                                        color: AppColors.textSecondaryColor),
                                  )),
                            )),
                        SizedBox(
                            width: 43.0.wp,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                            AppColors.primaryColor)),
                                onPressed: () {
                                  if (controller.currentpage.value ==
                                      controller.onboardData.length - 1) {
                                    // Appel de la méthode de transition
                                    NavigationHelper
                                        .navigateWithFadeInWithoutBack(context,
                                            LoginBinding(), const LoginView());
                                  } else {
                                    controller.goNextpage();
                                  }
                                },
                                child: const Text("Suivant"))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 900),
      margin: EdgeInsets.symmetric(horizontal: 1.0.wp),
      curve: Curves.easeInOut,
      width: isActive ? 5.0.wp : 1.5.wp,
      height: 0.8.hp,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(8), right: Radius.circular(8)),
        color: AppColors.primaryColor,
      ),
    );
  }
}
