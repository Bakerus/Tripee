import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/modules/recipe_payment/views/widgets/cash_in.dart';
import 'package:tripee/app/modules/recipe_payment/views/widgets/cash_out.dart';
import 'package:tripee/app/modules/recipe_payment/views/widgets/filter_bottom_sheet.dart';
import 'package:tripee/app/modules/recipe_payment/views/widgets/sort_bottom_sheet.dart';

import '../controllers/recipe_payment_controller.dart';

class RecipePaymentView extends GetView<RecipePaymentController> {
  RecipePaymentView({super.key});

  @override
  final controller = Get.put(RecipePaymentController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Tous les payements',
                style: Apptheme.ligthTheme.textTheme.headlineMedium),
                automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(10.0.hp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TabBar(
                    onTap: (index) {
                      controller.changeTabIndex(index);
                    },
                    indicatorColor: Colors.transparent,
                    overlayColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                    dividerColor: Colors.transparent,
                    labelPadding: EdgeInsets.symmetric(horizontal: 1.0.wp),
                    padding: EdgeInsets.symmetric(
                        horizontal: 25.0.wp, vertical: 1.5.hp),
                    tabs: [
                      Obx(() => Tab(
                            child: Container(
                              height: 4.4.hp,
                              width: 22.0.wp,
                              decoration: BoxDecoration(
                                color: controller.selectedTabIndex.value == 0
                                    ? AppColors.primaryColor
                                    : AppColors.textSecondaryColor
                                        .withOpacity(0.05),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  "Reçus",
                                  style: Apptheme
                                      .ligthTheme.textTheme.bodyMedium!
                                      .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color:
                                        controller.selectedTabIndex.value == 0
                                            ? Colors.white
                                            : AppColors.textSecondaryColor,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Obx(() => Tab(
                            child: Container(
                              height: 4.3.hp,
                              width: 22.0.wp,
                              decoration: BoxDecoration(
                                color: controller.selectedTabIndex.value == 1
                                    ? AppColors.primaryColor
                                    : AppColors.textSecondaryColor
                                        .withOpacity(0.05),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  "Dépensés",
                                  style: Apptheme
                                      .ligthTheme.textTheme.bodyMedium!
                                      .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color:
                                        controller.selectedTabIndex.value == 1
                                            ? Colors.white
                                            : AppColors.textSecondaryColor,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Container(
                    width: 100.0.wp,
                    height: 5.0.hp,
                    padding: EdgeInsets.symmetric(horizontal: 20.0.wp),
                    decoration: const BoxDecoration(
                        border: BorderDirectional(
                            bottom: BorderSide(
                                color: AppColors.textPlaceholderColor),
                            top: BorderSide(
                                color: AppColors.textPlaceholderColor))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              builder: (context) => SortBottomSheet(),
                              barrierColor: Colors.transparent,
                              sheetAnimationStyle: AnimationStyle(
                                duration: const Duration(milliseconds: 1500),
                                curve: Curves.fastEaseInToSlowEaseOut,
                              )),
                          child: Container(
                            height: 5.0.hp,
                            width: 30.0.wp,
                            decoration: const BoxDecoration(
                                border: BorderDirectional(
                                    end: BorderSide(
                                        color:
                                            AppColors.textPlaceholderColor))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Trier",
                                    style: Apptheme
                                        .ligthTheme.textTheme.titleMedium),
                                Icon(
                                  Icons.sort,
                                  size: 13.0.sp,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              builder: (context) => FilterBottomSheet(),
                              barrierColor: Colors.transparent,
                              sheetAnimationStyle: AnimationStyle(
                                duration: const Duration(milliseconds: 1500),
                                curve: Curves.fastEaseInToSlowEaseOut,
                              )),
                          child: SizedBox(
                            height: 5.0.hp,
                            width: 30.0.wp,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Filtrer",
                                    style: Apptheme
                                        .ligthTheme.textTheme.titleMedium),
                                Icon(
                                  Icons.filter_alt,
                                  size: 13.0.sp,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [CashIn(), CashOut()],
          )),
    );
  }
}
