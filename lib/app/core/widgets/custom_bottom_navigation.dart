import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/modules/dasboard/controllers/dashboard_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final DashboardController controller;
  const CustomBottomNavigationBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 9.3.hp,
      surfaceTintColor: AppColors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 3.0,
      child: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.0.wp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () => controller.onItemTapped(0),
                child: SizedBox(
                  height: 5.0.hp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/icones/home.svg',
                          width: 4.5.wp,
                          colorFilter: controller.selectedIndex.value == 0
                              ? const ColorFilter.mode(
                                  AppColors.primaryColor, BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  AppColors.textSecondaryColor,
                                  BlendMode.srcIn)),
                      Text("Accueil",
                          style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold,
                              color: controller.selectedIndex.value == 0
                                  ? AppColors.primaryColor
                                  : AppColors.textSecondaryColor))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => controller.onItemTapped(1),
                child: SizedBox(
                  height: 5.0.hp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/icones/activity.svg',
                          width: 3.5.wp,
                          colorFilter: controller.selectedIndex.value == 1
                              ? const ColorFilter.mode(
                                  AppColors.primaryColor, BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  AppColors.textSecondaryColor,
                                  BlendMode.srcIn)),
                      Text("Activité",
                          style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold,
                              color: controller.selectedIndex.value == 1
                                  ? AppColors.primaryColor
                                  : AppColors.textSecondaryColor))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => controller.onItemTapped(2),
                child: SizedBox(
                  height: 5.0.hp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/icones/payment.svg',
                          width: 3.0.wp,
                          colorFilter: controller.selectedIndex.value == 2
                              ? const ColorFilter.mode(
                                  AppColors.primaryColor, BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  AppColors.textSecondaryColor,
                                  BlendMode.srcIn)),
                      Text("Payment",
                          style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold,
                              color: controller.selectedIndex.value == 2
                                  ? AppColors.primaryColor
                                  : AppColors.textSecondaryColor))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => controller.onItemTapped(3),
                child: SizedBox(
                  height: 5.0.hp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/icones/message.svg',
                          width: 3.5.wp,
                          colorFilter: controller.selectedIndex.value == 3
                              ? const ColorFilter.mode(
                                  AppColors.primaryColor, BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  AppColors.textSecondaryColor,
                                  BlendMode.srcIn)),
                      Text("Message",
                          style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold,
                              color: controller.selectedIndex.value == 3
                                  ? AppColors.primaryColor
                                  : AppColors.textSecondaryColor))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => controller.onItemTapped(4),
                child: SizedBox(
                  height: 5.0.hp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/icones/compte.svg',
                          width: 3.5.wp,
                          colorFilter: controller.selectedIndex.value == 4
                              ? const ColorFilter.mode(
                                  AppColors.primaryColor, BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  AppColors.textSecondaryColor,
                                  BlendMode.srcIn)),
                      Text("Compte",
                          style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold,
                              color: controller.selectedIndex.value == 4
                                  ? AppColors.primaryColor
                                  : AppColors.textSecondaryColor))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
