import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/modules/user_account/views/widgets/manage_account.dart';
import 'package:tripee/app/modules/user_account/views/widgets/show_account.dart';

import '../controllers/user_account_controller.dart';

class UserAccountView extends GetView<UserAccountController> {
  UserAccountView({super.key});
  @override
  final controller = Get.put(UserAccountController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 2500),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: Obx(() => controller.currentStep.value == 1
            ? ManageAccount()
            : ShowAccount()));
  }
}
/*
- `UserAccountView` extends `GetView<UserAccountController>`, making it a view associated with `UserAccountController`, and it instantiates the controller as a permanent dependency.
- The `build` method defines the UI, utilizing `AnimatedSwitcher` to switch between `ManageAccount` and `ShowAccount` widgets based on the `currentStep` value from the controller.
- `AnimatedSwitcher` provides a fade transition with a duration of 2500 milliseconds between page `ManageAccount` (when `currentStep` is 1) and page `ShowAccount` (for any other value), creating a smooth transition effect.
- `Obx` is used to make `currentStep` reactive, automatically updating the view when `currentStep` changes in `UserAccountController`.
*/ 