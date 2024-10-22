import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/modules/user_account/views/widgets/manage_account.dart';
import 'package:tripee/app/modules/user_account/views/widgets/show_account.dart';

import '../controllers/user_account_controller.dart';

class UserAccountView extends GetView<UserAccountController> {
  UserAccountView({super.key});
  @override
  final controller = Get.put(UserAccountController());
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 1500),
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
