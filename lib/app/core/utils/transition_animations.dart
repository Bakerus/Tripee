import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationHelper {
  static void navigateWithFadeWithoutBack(
      BuildContext context, Bindings bindings, Widget view,
      {int milliseconds = 600}) {
    Get.offAll(
      () => view,
      binding: bindings,
      transition: Transition.fade,
      curve: Curves.fastEaseInToSlowEaseOut,
      duration: Duration(milliseconds: milliseconds),
    );
  }

  static void navigateWithFadeInWithoutBack(
      BuildContext context, Bindings binding, Widget view,
      {int milliseconds = 600}) {
    Get.offAll(
      () => view,
      binding: binding,
      transition: Transition.fadeIn,
      curve: Curves.fastEaseInToSlowEaseOut,
      duration: Duration(milliseconds: milliseconds),
    );
  }

  static void navigateWithFadeWithtBack(
      BuildContext context, Bindings bindings, Widget view) {
    Get.to(
      view,
      binding: bindings,
      transition: Transition.fade,
      duration: const Duration(milliseconds: 600),
    );
  }

  static void navigateWithFadeInWithBack(
      BuildContext context, Bindings bindings, Widget view) {
    Get.to(
      view,
      binding: bindings,
      curve: Curves.easeIn,
      transition: Transition.fadeIn,
      duration: const Duration(milliseconds: 600),
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
        transitionDuration: const Duration(milliseconds: 2),
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
      duration: const Duration(milliseconds: 10),
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

// *****************************************************************************
// NavigationHelper and PageTransitionSwitcher for Smooth Page Transitions
//
// This file contains two classes: `NavigationHelper` and `PageTransitionSwitcher` 
// designed to manage navigation and smooth page transitions in a Flutter 
// application.
//
// 1. NavigationHelper: A utility class that provides a series of methods to 
//    navigate between pages using the `GetX` package. It supports various 
//    transitions such as fade, fadeIn, and others with or without the 
//    ability to go back to the previous page. This class ensures a consistent 
//    navigation experience and reduces redundancy across the app by centralizing 
//    navigation logic.
//
// 2. PageTransitionSwitcher: A custom widget that allows for animated transitions 
//    between pages using a fade and slide combination. This provides a more 
//    visually appealing way to switch between pages.
//
// Features:
// - Navigate to the onboarding page or any other view with transitions such as 
//   fade or fadeIn.
// - Customize transition duration and behavior, with control over whether the 
//   back button is enabled or disabled.
// - Smooth animations between different views using `PageTransitionSwitcher`, 
//   which combines a slide and fade transition.
//
// Usage Example:
// - To navigate to a page without the ability to go back: 
//   `NavigationHelper.navigateWithFadeWithoutBack(context, binding, view)`
// - To use a custom page transition: 
//   `PageTransitionSwitcher(child: yourWidget, direction: 1)`
//
// *****************************************************************************