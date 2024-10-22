import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/card_post_activity.dart';
import 'package:tripee/app/modules/location_on_map/bindings/location_on_map_binding.dart';
import 'package:tripee/app/modules/location_on_map/views/location_on_map_view.dart';

import '../controllers/post_order_controller.dart';

class PostOrderView extends GetView<PostOrderController> {
  const PostOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 6.5.wp, vertical: 2.0.hp),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Toutes mes reservations',
            style: Apptheme.ligthTheme.textTheme.headlineSmall),
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
                            action: "Reservation",
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
                            action: "Reservation",
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
                            action: "Reservation",
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
                            action: "Reservation",
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
                            action: "Reservation",
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
                            action: "Reservation",
                          )),
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
