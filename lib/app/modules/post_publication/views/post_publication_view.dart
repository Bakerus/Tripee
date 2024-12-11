import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/card_post_activity.dart';
import 'package:tripee/app/modules/location_on_map/bindings/location_on_map_binding.dart';
import 'package:tripee/app/modules/location_on_map/views/location_on_map_view.dart';

import '../controllers/post_publication_controller.dart';

class PostPublicationView extends GetView<PostPublicationController> {
  PostPublicationView({super.key});
  @override
  final controller = Get.put(PostPublicationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 6.5.wp, vertical: 2.0.hp),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Tous mes trajets',
            style: Apptheme.ligthTheme.textTheme.headlineSmall),
        Expanded(
          child: Obx(
            () => (controller.searching.value == false)
                ? const SizedBox.shrink()
                : FutureBuilder(
                    future: controller.trajectList,
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
                                    Text("Aucun trajet trouvé",
                                        style: Apptheme.ligthTheme.textTheme
                                            .headlineMedium!
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
                              destination: trajet.arrivalPlace.name,
                              date: trajet.departureDate,
                              ontapForDeleted: () =>
                                  controller.deleteTrajetById(
                                      trajet.id, controller.userInfo!["token"]),
                              state: controller.parseStatut(trajet.status),
                              amount: trajet.price.toString(),
                              ontapForDetail: () =>
                                  NavigationHelper.navigateWithFadeWithtBack(
                                      context,
                                      LocationOnMapBinding(),
                                      LocationOnMapView(
                                        departurePlace:
                                            trajet.departurePlace.name,
                                        arrivalPlace: trajet.arrivalPlace.name,
                                        id: controller.userInfo!["userId"],
                                        rideId: trajet.id.toString(),
                                        userName:
                                            controller.userInfo!["username"],
                                        vehicleBrand:
                                            trajet.vehicle.vehicleBrand,
                                        vehiceNumber:
                                            trajet.vehicle.registrationNumber,
                                        email: trajet.user.email,
                                        imagePath: trajet.vehicle.imagePath,
                                        availablePlaces: "",
                                        latitudeDeparture: double.parse(
                                            trajet.departurePlace.latitude),
                                        longitudeDeparture: double.parse(
                                            trajet.departurePlace.longitude),
                                        latitudeArrival: double.parse(
                                            trajet.arrivalPlace.latitude),
                                        longitudeArrival: double.parse(
                                            trajet.arrivalPlace.longitude),
                                        maxPlaces:
                                            trajet.availablePlaces.toString(),
                                        state: controller
                                            .parseStatut(trajet.status),
                                        action: "Publication",
                                      )),
                            );
                          },
                        );
                      }
                    },
                  ),
          ),
        ),
      ]),
    ));
  }
}
