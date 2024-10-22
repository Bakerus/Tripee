import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/core/widgets/card_triper.dart';
import 'package:tripee/app/core/widgets/drop_down_customized.dart';
import 'package:tripee/app/modules/confirm_order/bindings/confirm_order_binding.dart';
import 'package:tripee/app/modules/confirm_order/views/confirm_order_view.dart';
import 'package:tripee/app/modules/order/bindings/order_binding.dart';
import 'package:tripee/app/modules/publication/views/widgets/hearder_section.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';
import 'package:tripee/app/modules/searching/bindings/searching_binding.dart';
import 'package:tripee/app/modules/searching/views/searching_view.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  final String? initialValueDepart;
  final String? initialValueArrive;
  const OrderView({super.key, this.initialValueDepart, this.initialValueArrive});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 97.0.hp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 5.5.wp, right: 5.5.wp, top: 2.0.hp),
                  width: 72.0.wp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CardHeader(
                        icon: Icons.arrow_back,
                      ),
                      Text(
                        "Rechercher un triper",
                        style: Apptheme.ligthTheme.textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                const HearderFirstSection(
                  actions: "Detaillez votre voyage",
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.0.wp),
                  padding: EdgeInsets.symmetric(horizontal: 3.5.wp),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bagages?",
                        style: Apptheme.ligthTheme.textTheme.bodyMedium!
                            .copyWith(
                                color: AppColors.darkColor,
                                fontWeight: FontWeight.w700),
                      ),
                      Obx(
                        () => DropDownCustomized(
                          itemsList: controller.bagages,
                          seletedItem: controller.selectedBagages.value,
                          updateSelectedItem: (p0) =>
                              controller.updateSelectedItem(
                            p0,
                            controller.selectedBagages,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Search(
                  initialValueDepart: initialValueDepart,
                  initialValueArrive: initialValueArrive,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.0.wp),
                  height: 7.0.hp,
                  color: AppColors.white,
                  child: ButtonsFormulaire(
                    title: "Lancer la recherche",
                    borderColor: AppColors.primaryColor,
                    backgroundColor: AppColors.primaryColor,
                    forgroundColor: AppColors.white,
                    onPressed: () {
                      NavigationHelper.navigateWithFadeWithtBack(
                          context,
                          SearchingBinding(),
                          SearchingView(
                            transition: () =>
                                NavigationHelper.navigateWithFadeWithtBack(
                                    context, OrderBinding(), const OrderView()),
                          ));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.5.wp),
                  child: Text(
                    "Résultat des recherches",
                    style: Apptheme.ligthTheme.textTheme.headlineMedium,
                  ),
                ),
                SizedBox(
                  height: 43.0.hp,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardTriper(
                          ontap: () =>
                              NavigationHelper.navigateWithFadeWithtBack(
                                  context,
                                  ConfirmOrderBinding(),
                                  const ConfirmOrderView()),
                        ),
                        CardTriper(
                          ontap: () =>
                              NavigationHelper.navigateWithFadeWithtBack(
                                  context,
                                  ConfirmOrderBinding(),
                                  const ConfirmOrderView()),
                        ),
                        CardTriper(
                          ontap: () =>
                              NavigationHelper.navigateWithFadeWithtBack(
                                  context,
                                  ConfirmOrderBinding(),
                                  const ConfirmOrderView()),
                        ),
                        CardTriper(
                          ontap: () =>
                              NavigationHelper.navigateWithFadeWithtBack(
                                  context,
                                  ConfirmOrderBinding(),
                                  const ConfirmOrderView()),
                        ),
                        CardTriper(
                          ontap: () =>
                              NavigationHelper.navigateWithFadeWithtBack(
                                  context,
                                  ConfirmOrderBinding(),
                                  const ConfirmOrderView()),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
