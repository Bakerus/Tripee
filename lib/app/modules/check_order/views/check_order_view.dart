import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/data/models/reservation_response_model.dart';
import 'package:tripee/app/modules/check_order/views/widgets/features_check_order.dart';
import 'package:tripee/app/modules/check_order/views/widgets/slider_button.dart';

import '../controllers/check_order_controller.dart';

class CheckOrderView extends GetView<CheckOrderController> {
  final Future<List<ReservationResponseModel>>? reservationList;
  const CheckOrderView({super.key, this.reservationList});
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
                    "Demandes de reservation",
                    style: Apptheme.ligthTheme.textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SliderButton(
                  icons: Icons.arrow_back,
                ),
                FeaturesCheckOrder(
                  width: 90.0,
                  horizontalPadding: 1.0,
                  reservationList: reservationList,
                ),
                const SliderButton(
                  icons: Icons.arrow_forward,
                ),
              ],
            ),
            Obx(
              () => Container(
                width: 100.0.wp,
                height: 24.0.hp,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  border: Border(
                      top:
                          BorderSide(width: 1.0, color: AppColors.borderColor)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total'),
                        Text(" ${controller.totalAmount.value}\$ ",
                            style: Apptheme.ligthTheme.textTheme.headlineSmall!
                                .copyWith(color: AppColors.textColor))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Places restantes'),
                        Text("-- Places",
                            style: Apptheme.ligthTheme.textTheme.headlineSmall!
                                .copyWith(color: AppColors.textColor))
                      ],
                    ),
                    ButtonsFormulaire(
                      title: "Valider la demande",
                      backgroundColor: AppColors.primaryColor,
                      forgroundColor: AppColors.white,
                      borderColor: Colors.transparent,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
