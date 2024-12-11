import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/modules/location_on_map/controllers/location_on_map_controller.dart';
import 'package:tripee/app/modules/post_activity/bindings/post_activity_binding.dart';
import 'package:tripee/app/modules/post_activity/views/post_activity_view.dart';

class OptionsPostPublication extends StatelessWidget {
  final int rideId;
  final String state;
  OptionsPostPublication({
    super.key,
    required this.rideId,
    this.state = "",
  });
  final controller = Get.put(LocationOnMapController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 34.0.wp,
          child: ButtonsFormulaire(
              title: "Lancer le trajet",
              forgroundColor: (state == "En attente")
                  ? AppColors.white
                  : AppColors.textPlaceholderColor,
              backgroundColor: (state == "En attente")
                  ? Colors.lightBlueAccent
                  : AppColors.white,
              borderColor: Colors.transparent,
              verticalPadding: 8.0,
              horizontalPadding: 8.0,
              onPressed: () {
                controller.startRide(controller.userInfo!["token"], rideId);

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  NavigationHelper.navigateWithFadeWithoutBack(
                      context, PostActivityBinding(), const PostActivityView());
                });
              }),
        ),
        SizedBox(
          width: 34.0.wp,
          child: ButtonsFormulaire(
              title: "Terminer le trajet",
              forgroundColor: (state == "En attente")
                  ? AppColors.textPlaceholderColor
                  : AppColors.white,
              backgroundColor: (state == "En attente")
                  ? AppColors.white
                  : AppColors.primaryColor,
              borderColor: Colors.transparent,
              verticalPadding: 8.0,
              horizontalPadding: 8.0,
              onPressed: () {
                controller.terminateRide(controller.userInfo!["token"], rideId);

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  NavigationHelper.navigateWithFadeWithoutBack(
                      context, PostActivityBinding(), const PostActivityView());
                });
              }),
        )
      ],
    );
  }
}
