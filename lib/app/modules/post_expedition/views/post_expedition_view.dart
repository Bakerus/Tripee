import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/card_post_activity.dart';
import 'package:tripee/app/modules/location_on_map/bindings/location_on_map_binding.dart';
import 'package:tripee/app/modules/location_on_map/views/location_on_map_view.dart';
import 'package:tripee/app/modules/post_expedition/views/widgets/transporteur_view.dart';

import '../controllers/post_expedition_controller.dart';

class PostExpeditionView extends GetView<PostExpeditionController> {
  const PostExpeditionView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = PostExpeditionController();
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 6.5.wp, vertical: 2.0.hp),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Obx(
          () => DropdownButton<String>(
              borderRadius: BorderRadius.circular(8),
              underline: const SizedBox(),
              style: Apptheme.ligthTheme.textTheme.headlineSmall,
              icon: Container(
                padding: EdgeInsets.only(left: 1.0.wp),
                child: Icon(
                  Icons.arrow_drop_down_outlined,
                  color: AppColors.textSecondaryColor,
                  size: 20.0.sp,
                ),
              ),
              items: controller.expeditionsItems.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (value) {
                controller.updateSelectedItem(value.toString());
              },
              value: controller.selectedItem.value),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardPostActivity(
                  destination: "Destination",
                  date: "02 Septembre 2024",
                  state: "Terminé",
                  amount: '1500',
                  ontapForDetail: () =>
                      NavigationHelper.navigateWithFadeWithtBack(
                          context,
                          LocationOnMapBinding(),
                          const LocationOnMapView(
                            state: "Terminé",
                            action: "Expedition",
                          )),
                ),
                CardPostActivity(
                  destination: "Destination",
                  date: "02 Septembre 2024",
                  state: "Terminé",
                  amount: '1500',
                  ontapForDetail: () =>
                      NavigationHelper.navigateWithFadeWithtBack(
                          context,
                          LocationOnMapBinding(),
                          const LocationOnMapView(
                            state: "Terminé",
                            action: "Expedition",
                          )),
                ),
                CardPostActivity(
                  destination: "Destination",
                  date: "02 Septembre 2024",
                  state: "Terminé",
                  amount: '1500',
                  ontapForDetail: () =>
                      NavigationHelper.navigateWithFadeWithtBack(
                          context,
                          LocationOnMapBinding(),
                          const LocationOnMapView(
                            state: "Terminé",
                            action: "Expedition",
                          )),
                ),
                CardPostActivity(
                  destination: "Destination",
                  date: "02 Septembre 2024",
                  state: "Terminé",
                  amount: '1500',
                  ontapForDetail: () =>
                      NavigationHelper.navigateWithFadeWithtBack(
                          context,
                          LocationOnMapBinding(),
                          const LocationOnMapView(
                            state: "Terminé",
                            action: "Expedition",
                          )),
                ),
                CardPostActivity(
                  destination: "Destination",
                  date: "02 Septembre 2024",
                  state: "Terminé",
                  amount: '1500',
                  ontapForDetail: () =>
                      NavigationHelper.navigateWithFadeWithtBack(
                          context,
                          LocationOnMapBinding(),
                          const LocationOnMapView(
                            state: "Terminé",
                            action: "Expedition",
                          )),
                ),
                CardPostActivity(
                  destination: "Destination",
                  date: "02 Septembre 2024",
                  state: "Terminé",
                  amount: '1500',
                  ontapForDetail: () =>
                      NavigationHelper.navigateWithFadeWithtBack(
                          context,
                          LocationOnMapBinding(),
                          const LocationOnMapView(
                            state: "Terminé",
                            action: "Expedition",
                          )),
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          if (controller.selectedItem.value.toString() == 'Transporteur') {
            return const TransporteurView();
          } else {
            return const SizedBox
                .shrink(); // Ne rien afficher si la condition n'est pas remplie
          }
        })
      ]),
    ));
  }
}
