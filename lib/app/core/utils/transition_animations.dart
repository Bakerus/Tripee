import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/modules/onboardin_screen/views/onboardin_screen_view.dart';
import 'package:tripee/app/modules/onboardin_screen/bindings/onboardin_screen_binding.dart';

class NavigationHelper {
  static void navigateToOnboardingPage(BuildContext context) {
    Get.offAll(
      () => const OnboardinScreenView(),
      binding: OnboardinScreenBinding(),
      transition: Transition.fade,
      duration: const Duration(seconds: 2),
    );
  }

  static void navigateWithFadeWithoutBack(
      BuildContext context, Bindings bindings, Widget view) {
    Get.offAll(
      () => view,
      binding: bindings,
      transition: Transition.fade,
      duration: const Duration(seconds: 2),
    );
  }

  static void navigateWithFadeInWithoutBack(
      BuildContext context, Bindings binding, Widget view) {
    Get.offAll(
      () => view,
      binding: binding,
      curve: Curves.easeInOut,
      transition: Transition.fadeIn,
      duration: const Duration(seconds: 2),
    );
  }

  static void navigateWithFadeWithtBack(
      BuildContext context, Bindings bindings, Widget view) {
    Get.to(
      view,
      binding: bindings,
      transition: Transition.fade,
      duration: const Duration(seconds: 2),
    );
  }

  static void navigateWithFadeInWithBack(
      BuildContext context, Bindings bindings, Widget view) {
    Get.to(
      view,
      binding: bindings,
      curve: Curves.easeInOut,
      transition: Transition.fadeIn,
      duration: const Duration(seconds: 2),
    );
  }

  static void navigateToSuccesOrFailedPage(BuildContext context, Widget view) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => view,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(seconds: 2),
      ),
    );
  }
}

class PageTransitionSwitcher extends StatelessWidget {
  final Widget child;
  final int direction;

  const PageTransitionSwitcher({
    super.key,
    required this.child,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 10),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final offsetAnimation = Tween<Offset>(
          begin: Offset(direction.toDouble(), 0.0),
          end: Offset.zero,
        ).animate(animation);

        final fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(animation);

        return ClipRect(
          child: SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: child,
            ),
          ),
        );
      },
      child: child,
    );
  }
}
