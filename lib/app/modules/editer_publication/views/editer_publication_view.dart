import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/core/widgets/card_triper.dart';
import 'package:tripee/app/core/widgets/features_edit_section.dart';
import 'package:tripee/app/modules/dasboard/bindings/dashboard_binding.dart';
import 'package:tripee/app/modules/dasboard/views/dashboard_view.dart';
import 'package:tripee/app/modules/publication/bindings/publication_binding.dart';
import 'package:tripee/app/modules/publication/views/publication_view.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';

import '../controllers/editer_publication_controller.dart';

class EditerPublicationView extends GetView<EditerPublicationController> {
  EditerPublicationView({super.key});
  @override
  final controller = Get.put(EditerPublicationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.grayColor,
          body: SingleChildScrollView(
            child: SizedBox(
              height: 96.5.hp,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 5.5.wp, right: 5.5.wp, top: 2.0.hp),
                      width: 82.0.wp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CardHeader(
                            icon: Icons.arrow_back,
                          ),
                          Text(
                            "Detail de la publication",
                            style: Apptheme.ligthTheme.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                    const CardTriper(),

                    const Search(),
                    const FeaturesEditSection(),

                    // Boutons en bas
                    Container(
                      width: 100.0.wp,
                      height: 18.0.hp,
                      padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        border: Border(
                            top: BorderSide(
                                width: 1.0, color: AppColors.borderColor)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonsFormulaire(
                              title: "Editer la publication ",
                              backgroundColor: AppColors.white,
                              forgroundColor: AppColors.tertiaryColor,
                              borderColor: AppColors.tertiaryColor,
                              onPressed: () {
                                NavigationHelper.navigateWithFadeInWithBack(
                                    context,
                                    PublicationBinding(),
                                    const PublicationView());
                              }),
                          ButtonsFormulaire(
                              title: "Retour à l'activité",
                              backgroundColor: AppColors.tertiaryColor,
                              forgroundColor: AppColors.white,
                              borderColor: Colors.transparent,
                              onPressed: () {
                                NavigationHelper.navigateWithFadeInWithBack(
                                    context,
                                    DashboardBinding(),
                                    DashboardView());
                              }),
                        ],
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}
