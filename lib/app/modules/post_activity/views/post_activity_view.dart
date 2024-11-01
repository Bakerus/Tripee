import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/modules/post_expedition/views/post_expedition_view.dart';
import 'package:tripee/app/modules/post_order/views/post_order_view.dart';
import 'package:tripee/app/modules/post_publication/views/post_publication_view.dart';
import '../controllers/post_activity_controller.dart';

class PostActivityView extends GetView<PostActivityController> {
  const PostActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostActivityController());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Activité',
              style: Apptheme.ligthTheme.textTheme.headlineMedium),
              automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            onTap: (index) {
              controller.changeTabIndex(index);
            },
            indicatorColor: Colors.transparent,
            overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
            dividerColor: Colors.transparent,
            labelPadding: EdgeInsets.symmetric(horizontal: 1.0.wp),
            padding: EdgeInsets.symmetric(
              horizontal: 2.0.wp,
            ),
            tabs: [
              Obx(() => Tab(
                    child: Container(
                      height: 4.4.hp,
                      decoration: BoxDecoration(
                        color: controller.selectedTabIndex.value == 0
                            ? AppColors.primaryColor
                            : AppColors.textSecondaryColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          "Trajets publiés",
                          style: Apptheme.ligthTheme.textTheme.bodyMedium!
                              .copyWith(
                            fontWeight: FontWeight.w700,
                            color: controller.selectedTabIndex.value == 0
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
                      decoration: BoxDecoration(
                        color: controller.selectedTabIndex.value == 1
                            ? AppColors.primaryColor
                            : AppColors.textSecondaryColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          "Réservations",
                          style: Apptheme.ligthTheme.textTheme.bodyMedium!
                              .copyWith(
                            fontWeight: FontWeight.w700,
                            color: controller.selectedTabIndex.value == 1
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
                      decoration: BoxDecoration(
                        color: controller.selectedTabIndex.value == 2
                            ? AppColors.primaryColor
                            : AppColors.textSecondaryColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          "Expéditions",
                          style: Apptheme.ligthTheme.textTheme.bodyMedium!
                              .copyWith(
                            fontWeight: FontWeight.w700,
                            color: controller.selectedTabIndex.value == 2
                                ? Colors.white
                                : AppColors.textSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        body:  TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            PostPublicationView(),
            PostOrderView(),
            PostExpeditionView(),
          ],
        ),
      ),
    );
  }
}
