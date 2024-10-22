import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/custom_bottom_navigation.dart';
import 'package:tripee/app/modules/home/views/home_view.dart';
import 'package:tripee/app/modules/post_activity/views/post_activity_view.dart';
import 'package:tripee/app/modules/recipe_message/views/recipe_message_view.dart';
import 'package:tripee/app/modules/recipe_payment/views/recipe_payment_view.dart';
import 'package:tripee/app/modules/user_account/views/user_account_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({super.key});
  final List<Widget> pages = [
    const HomeView(),
    const PostActivityView(),
    RecipePaymentView(),
    const RecipeMessageView(),
     UserAccountView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        int direction =
            controller.selectedIndex.value > controller.previousIndex.value
                ? 1
                : -1;
        return IndexedStack(
          index: controller.selectedIndex.value,
          children: pages.asMap().entries.map((entry) {
            int idx = entry.key;
            Widget page = entry.value;
            return PageTransitionSwitcher(
              direction: direction,
              key: ValueKey<int>(idx),
              child: page, // Utilisez une clé pour chaque page
            );
          }).toList(),
        );
      }),
      bottomNavigationBar: CustomBottomNavigationBar(controller: controller),
    );
  }
}
