import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/card_post_activity.dart';
import 'package:tripee/app/modules/location_on_map/bindings/location_on_map_binding.dart';
import 'package:tripee/app/modules/location_on_map/views/location_on_map_view.dart';

import '../controllers/post_order_controller.dart';

class PostOrderView extends GetView<PostOrderController> {
  PostOrderView({super.key});
  @override
  final controller = Get.put(PostOrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 6.5.wp, vertical: 2.0.hp),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Toutes mes reservations',
            style: Apptheme.ligthTheme.textTheme.headlineSmall),
        Expanded(
            child: Obx(
          () => (controller.searching.value == false)
              ? const SizedBox.shrink()
              : FutureBuilder(
                  future: controller.reservationList,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 6,
                        color: AppColors.primaryColor,
                      ));
                    } else if (snapshot.hasError) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.backgroundColor,
                            radius: 40.0.sp,
                            child: Icon(
                              Icons.close,
                              color: AppColors.redColor,
                              size: 40.0.sp,
                            ),
                          ),
                          SizedBox(
                            height: 13.0.hp,
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Aucune Reservation trouvée",
                                      style: Apptheme
                                          .ligthTheme.textTheme.headlineMedium!
                                          .copyWith(
                                        color: AppColors.redColor,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      final trajets = snapshot.data;
                      return ListView.builder(
                        itemCount: trajets!.length,
                        itemBuilder: (context, index) {
                          final trajet = trajets[index];
                          return CardPostActivity(
                              destination: trajet.arrivalPLace,
                              date: trajet.reservationDate,
                              state: controller
                                  .parseStatut(trajet.reservationStatus),
                              amount: trajet.price.toString(),
                              ontapForDeleted: () =>
                                  controller.deletReservationId(
                                      trajet.id, controller.userInfo!["token"]),
                              ontapForDetail: () async {
                                await controller.fetchDriverInfos(
                                    trajet.rideId.toString(),
                                    controller.userInfo!["token"]);
                                NavigationHelper.navigateWithFadeWithtBack(
                                    context.mounted ? context : context,
                                    LocationOnMapBinding(),
                                    LocationOnMapView(
                                      departurePlace: controller
                                          .infoDriverPublication!
                                          .departurePlace
                                          .name,
                                      latitudeDeparture: double.parse(controller
                                          .infoDriverPublication!
                                          .departurePlace
                                          .latitude),
                                      longitudeDeparture: double.parse(
                                          controller.infoDriverPublication!
                                              .departurePlace.longitude),
                                      latitudeArrival: double.parse(controller
                                          .infoDriverPublication!
                                          .arrivalPlace
                                          .latitude),
                                      longitudeArrival: double.parse(controller
                                          .infoDriverPublication!
                                          .arrivalPlace
                                          .longitude),
                                      arrivalPlace: controller
                                          .infoDriverPublication!
                                          .arrivalPlace
                                          .name,
                                      email: controller
                                          .infoDriverPublication!.user.email,
                                      userName: controller
                                          .infoDriverPublication!.user.userName,
                                      vehiceNumber: controller
                                          .infoDriverPublication!
                                          .vehicle
                                          .registrationNumber,
                                      id: controller
                                          .infoDriverPublication!.user.id
                                          .toString(),
                                      imagePath: controller
                                          .infoDriverPublication!
                                          .vehicle
                                          .imagePath,
                                      vehicleBrand: controller
                                          .infoDriverPublication!
                                          .vehicle
                                          .vehicleBrand,
                                      maxPlaces: controller
                                          .infoDriverPublication!
                                          .availablePlaces
                                          .toString(),
                                      state: controller.parseStatut(
                                          trajet.reservationStatus),
                                      action: "Reservation",
                                    ));
                              });
                        },
                      );
                    }
                  },
                ),
        )),
      ]),
    ));
  }
}

//Central Station
//Airport