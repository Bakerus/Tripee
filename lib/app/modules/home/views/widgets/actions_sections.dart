import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/modules/expedition/bindings/expedition_binding.dart';
import 'package:tripee/app/modules/expedition/views/expedition_view.dart';
import 'package:tripee/app/modules/home/views/widgets/card_home.dart';
import 'package:tripee/app/modules/order/bindings/order_binding.dart';
import 'package:tripee/app/modules/order/views/order_view.dart';
import 'package:tripee/app/modules/publication/bindings/publication_binding.dart';
import 'package:tripee/app/modules/publication/views/publication_view.dart';

class ActionsSections extends StatelessWidget {
  const ActionsSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.0.wp,
        height: 20.0.hp,
        margin: EdgeInsets.symmetric(vertical: 2.0.hp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.5.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Actions rapides",
                    style: Apptheme.ligthTheme.textTheme.headlineMedium!
                        .copyWith(color: AppColors.tertiaryColor),
                  ),
                  const CircleAvatar(
                    radius: 16.0,
                    backgroundColor: AppColors.darkColor,
                    child: Icon(Icons.arrow_forward),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => NavigationHelper.navigateWithFadeInWithBack(
                          context,
                          PublicationBinding(),
                          const PublicationView()),
                      child: const CardHome(
                        cardColor: AppColors.primaryColor,
                        circleAvatarColor: AppColors.darkColor,
                        iconColor:
                            ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                        label: "Publier un trajet",
                        iconName: "assets/icones/publication.svg",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => NavigationHelper.navigateWithFadeInWithBack(
                          context, ExpeditionBinding(), const ExpeditionView()),
                      child: const CardHome(
                        cardColor: AppColors.tertiaryColor,
                        circleAvatarColor: AppColors.white,
                        iconColor: ColorFilter.mode(
                            AppColors.primaryColor, BlendMode.srcIn),
                        label: "Expédier un colis",
                        iconName: "assets/icones/colis.svg",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => NavigationHelper.navigateWithFadeInWithBack(
                          context, OrderBinding(),  const OrderView()),
                      child: const CardHome(
                        cardColor: AppColors.darkColor,
                        circleAvatarColor: AppColors.primaryColor,
                        iconColor:
                            ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                        label: "Reserver un trajet",
                        iconName: "assets/icones/reservation.svg",
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
