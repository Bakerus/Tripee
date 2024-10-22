import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/modules/check_order/bindings/check_order_binding.dart';
import 'package:tripee/app/modules/check_order/views/check_order_view.dart';
import 'package:tripee/app/modules/discussion_message/bindings/discussion_message_binding.dart';
import 'package:tripee/app/modules/discussion_message/views/discussion_message_view.dart';
import 'package:tripee/app/modules/editer_publication/views/widgets/details_publication.dart';
import 'package:tripee/app/modules/location_on_map/views/widgets/infos_car.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfosDriver extends StatelessWidget {
  final String action;
  const InfosDriver({super.key, this.action = ""});

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
                CircleAvatar(
                  radius: 25.0.sp,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("#7ASHSF",
                        style: Apptheme.ligthTheme.textTheme.titleSmall!
                            .copyWith(color: AppColors.textSecondaryColor)),
                    Text("Leilani Angelo",
                        style: Apptheme.ligthTheme.textTheme.titleLarge!
                            .copyWith(color: AppColors.darkColor)),
                    Text("leilaniangelo@gmail.com",
                        style: Apptheme.ligthTheme.textTheme.bodyMedium!
                            .copyWith(color: AppColors.darkColor)),
                  ],
                ),
                GestureDetector(
                  onTap: () => (action != "Publication")
                      ? NavigationHelper.navigateWithFadeInWithBack(
                          context,
                          DiscussionMessageBinding(),
                          const DiscussionMessageView())
                      : NavigationHelper.navigateWithFadeInWithBack(
                          context, CheckOrderBinding(), const CheckOrderView()),
                  child: SvgPicture.asset(
                    (action != "Publication")
                        ? 'assets/icones/button_messagerie.svg'
                        : 'assets/icones/button_check_order.svg',
                    width: 9.0.wp,
                  ),
                ),
              ],
            ),
            const InfosCar(
              title: "Marque",
              description: "Toyota Tundra",
            ),
            const InfosCar(
              title: "immatriculation",
              description: "AA89BT",
            ),
            const InfosCar(
              title: "Couleur",
              description: "Rouge",
            ),
            const InfosCar(
              title: "Nombre de passagers",
              description: "3/4",
            ),
            GestureDetector(
                child: const InfosCar(
                  title: "Details trajet",
                  description: ">",
                ),
                onTap: () {
                  NavigationHelper.navigateToSuccesOrFailedPage(
                      context, const DetailsPublication());
                }),
            if (action != "Publication")
              GestureDetector(
                  child: const InfosCar(
                    title: "Details reservation",
                    description: ">",
                  ),
                  onTap: () {
                    NavigationHelper.navigateToSuccesOrFailedPage(
                        context, const DetailsPublication());
                  })
          ],
        ));
  }
}
