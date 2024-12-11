import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/modules/check_order/bindings/check_order_binding.dart';
import 'package:tripee/app/modules/check_order/views/check_order_view.dart';
import 'package:tripee/app/modules/discussion_message/bindings/discussion_message_binding.dart';
import 'package:tripee/app/modules/discussion_message/views/discussion_message_view.dart';
import 'package:tripee/app/modules/location_on_map/controllers/location_on_map_controller.dart';
import 'package:tripee/app/modules/location_on_map/views/widgets/infos_car.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tripee/app/modules/post_publication/controllers/post_publication_controller.dart';

class InfosDriver extends StatelessWidget {
  final String action;
  final String? imagePath;
  final String id;
  final String rideId;
  final String userName;
  final String email;
  final String vehicleBrand;
  final String vehiceNumber;
  final String availablePlaces;
  final String maxPlaces;
  InfosDriver(
      {super.key,
      required this.action,
      this.imagePath,
      required this.id,
      required this.rideId,
      required this.userName,
      required this.email,
      required this.vehicleBrand,
      required this.vehiceNumber,
      required this.availablePlaces,
      required this.maxPlaces});

  final controller = Get.find<PostPublicationController>();
  final locationController = Get.find<LocationOnMapController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(13),
        width: 85.0.wp,
        height: 29.0.hp,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 57.0.wp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 26.0.sp,
                        backgroundImage: (imagePath != null)
                            ? NetworkImage(imagePath.toString())
                            : const AssetImage(
                                'assets/images/placeholder.jpeg'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(id,
                              softWrap: true,
                              style: Apptheme.ligthTheme.textTheme.titleSmall!
                                  .copyWith(
                                      color: AppColors.textSecondaryColor)),
                          Text(userName,
                              style: Apptheme.ligthTheme.textTheme.titleLarge!
                                  .copyWith(color: AppColors.darkColor)),
                          Text(email,
                              style: Apptheme.ligthTheme.textTheme.bodyMedium!
                                  .copyWith(color: AppColors.darkColor)),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (action != "Publication") {

                      await locationController.checkExistConversation(
                          convId:
                              "${locationController.userInfo!["userId"]}-${int.parse(id)}",
                          interlocutorId: int.parse(id),
                          interlocutorName: userName,
                          userId:
                              int.parse(locationController.userInfo!["userId"]),
                          username: locationController.userInfo!["username"]);

                      if (locationController.conversationExist.value == false) {
                        await locationController.createConversation(
                            convId:
                                "${locationController.userInfo!["userId"]}-${int.parse(id)}",
                            userId: int.parse(
                                locationController.userInfo!["userId"]),
                            username: locationController.userInfo!["username"],
                            interlocutorId: int.parse(id),
                            interlocutorName: userName);

                        NavigationHelper.navigateWithFadeInWithBack(
                            context.mounted ? context : context,
                            DiscussionMessageBinding(),
                            DiscussionMessageView(
                              userName: userName,
                              senderId:
                                  int.parse(controller.userInfo!["userId"]),
                              receiverId: int.parse(id),
                              convId:
                                  "${locationController.userInfo!["userId"]}-${int.parse(id)}",
                            ));
                      } else {
                        NavigationHelper.navigateWithFadeInWithBack(
                            context.mounted ? context : context,
                            DiscussionMessageBinding(),
                            DiscussionMessageView(
                              userName: userName,
                              senderId:
                                  int.parse(controller.userInfo!["userId"]),
                              receiverId: int.parse(id),
                              convId:
                                  "${locationController.userInfo!["userId"]}-${int.parse(id)}",
                            ));
                      }
                    } else {
                      await controller.checkDemandReservation(
                          rideId, controller.userInfo!["token"]);

                      NavigationHelper.navigateWithFadeInWithBack(
                          context.mounted ? context : context,
                          CheckOrderBinding(),
                          CheckOrderView(
                            userName: userName,
                            reservationList: controller.reserVationsList,
                          ));
                    }
                  },
                  child: SvgPicture.asset(
                    (action != "Publication")
                        ? 'assets/icones/button_messagerie.svg'
                        : 'assets/icones/button_check_order.svg',
                    width: 9.0.wp,
                  ),
                ),
              ],
            ),
            InfosCar(
              title: "Marque",
              description: vehicleBrand,
            ),
            InfosCar(
              title: "immatriculation",
              description: vehiceNumber,
            ),
            InfosCar(
              title: "Nombre de passagers",
              description: "$availablePlaces/$maxPlaces",
            ),
            GestureDetector(
                child: const InfosCar(
                  title: "Details trajet",
                  description: ">",
                ),
                onTap: () {}),
            if (action != "Publication")
              GestureDetector(
                  child: const InfosCar(
                    title: "Details reservation",
                    description: ">",
                  ),
                  onTap: () {})
          ],
        ));
  }
}
