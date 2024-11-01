import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/core/widgets/features_expedition.dart';
import 'package:tripee/app/modules/dasboard/bindings/dashboard_binding.dart';
import 'package:tripee/app/modules/dasboard/views/dashboard_view.dart';
import 'package:tripee/app/modules/publication/views/widgets/hearder_section.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';
import 'package:tripee/app/modules/search_result/bindings/search_result_binding.dart';
import 'package:tripee/app/modules/search_result/views/search_result_view.dart';
import 'package:tripee/app/modules/searching/bindings/searching_binding.dart';
import 'package:tripee/app/modules/searching/views/searching_view.dart';

import '../controllers/expedition_controller.dart';

class ExpeditionView extends GetView<ExpeditionController> {
  const ExpeditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grayColor,
        body: SafeArea(
          child: SizedBox(
            height: 99.0.hp,
            child: SingleChildScrollView(
              child: SizedBox(
                height: 97.0.hp,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 5.5.wp, right: 5.5.wp, top: 2.0.hp),
                        width: 63.0.wp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: ()=>Get.back(),
                              child: const CardHeader(
                                icon: Icons.arrow_back,
                              ),
                            ),
                            Text(
                              "Expedier un colis",
                              style:
                                  Apptheme.ligthTheme.textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                      const HearderFirstSection(
                        actions: "Detaillez votre expedition",
                      ),
                      Search(
                        lieuDepart: controller.lieuDepart,
                        lieuArrive: controller.lieuArrive,
                      ),
                      FeaturesExpedition(),
                      Container(
                        width: 100.0.wp,
                        height: 18.5.hp,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: AppColors.borderColor)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonsFormulaire(
                              title: "Annuler",
                              backgroundColor: AppColors.white,
                              forgroundColor: AppColors.tertiaryColor,
                              borderColor: AppColors.tertiaryColor,
                              onPressed: () {
                                NavigationHelper.navigateWithFadeInWithBack(
                                    context,
                                    DashboardBinding(),
                                    DashboardView());
                              },
                            ),
                            ButtonsFormulaire(
                              title: "Trouver un triper",
                              backgroundColor: AppColors.primaryColor,
                              forgroundColor: AppColors.white,
                              borderColor: Colors.transparent,
                              onPressed: () async {
                                controller.getExpeditionInfos();
                                await controller.searchTrajet(
                                    controller.lieuDepart.value,
                                    controller.lieuArrive.value,
                                    controller.userInfo!['token']);
                                NavigationHelper.navigateWithFadeInWithBack(
                                    context.mounted ? context : context,
                                    SearchingBinding(),
                                    SearchingView(
                                      transition: () => NavigationHelper
                                          .navigateWithFadeWithtBack(
                                              context,
                                              SearchResultBinding(),
                                              const SearchResultView()),
                                    ));
                              },
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}
