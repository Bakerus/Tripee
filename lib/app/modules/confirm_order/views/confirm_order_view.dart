import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/core/widgets/card_triper.dart';

import 'package:tripee/app/core/widgets/features_order.dart';
import 'package:tripee/app/core/widgets/loader_page.dart';
import 'package:tripee/app/modules/dasboard/bindings/dashboard_binding.dart';
import 'package:tripee/app/modules/dasboard/views/dashboard_view.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';

import '../controllers/confirm_order_controller.dart';

class ConfirmOrderView extends GetView<ConfirmOrderController> {
  const ConfirmOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 5.5.wp, right: 5.5.wp, top: 2.0.hp),
              width: 85.0.wp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CardHeader(
                    icon: Icons.arrow_back,
                  ),
                  Text(
                    "Confirmer la reservationn",
                    style: Apptheme.ligthTheme.textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            CardTriper(),
            const Search(),
            Featuresorder(),
            Container(
              width: 100.0.wp,
              height: 18.0.hp,
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border(
                    top: BorderSide(width: 1.0, color: AppColors.borderColor)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total'),
                      Text("500",
                          style: Apptheme.ligthTheme.textTheme.headlineLarge!
                              .copyWith(color: AppColors.textColor))
                    ],
                  ),
                  ButtonsFormulaire(
                    title: "Reservé",
                    backgroundColor: AppColors.primaryColor,
                    forgroundColor: AppColors.white,
                    borderColor: Colors.transparent,
                    onPressed: () {
                      NavigationHelper.navigateToSuccesOrFailedPage(
                          context,
                          LoaderPage(
                            actions: "Réservation effectuée",
                            transition: () =>
                                NavigationHelper.navigateWithFadeInWithBack(
                                    context,
                                    DashboardBinding(),
                                    DashboardView()),
                          ));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
