import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/data/models/reservation_response_model.dart';
import 'package:tripee/app/modules/check_order/views/widgets/features_check_order.dart';
import 'package:tripee/app/modules/check_order/views/widgets/slider_button.dart';

import '../controllers/check_order_controller.dart';

class CheckOrderView extends GetView<CheckOrderController> {
  final Future<List<ReservationResponseModel>>? reservationList;
  final String userName;
  const CheckOrderView({super.key, this.reservationList, this.userName = ""});
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
                  userName: userName,
                  reservationList: reservationList,
                ),
                const SliderButton(
                  icons: Icons.arrow_forward,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
