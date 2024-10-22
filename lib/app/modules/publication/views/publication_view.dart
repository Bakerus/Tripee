import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/core/widgets/loader_page.dart';
import 'package:tripee/app/modules/editer_publication/bindings/editer_publication_binding.dart';
import 'package:tripee/app/modules/editer_publication/views/editer_publication_view.dart';
import 'package:tripee/app/modules/publication/views/widgets/feature_second_section.dart';
import 'package:tripee/app/modules/publication/views/widgets/features_first_section.dart';
import 'package:tripee/app/modules/publication/views/widgets/header_second_section.dart';
import 'package:tripee/app/modules/publication/views/widgets/hearder_section.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';
import '../controllers/publication_controller.dart';

class PublicationView extends GetView<PublicationController> {
  const PublicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayColor,
      body: SafeArea(
        child: SizedBox(
          height: 99.0.hp,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 96.5.hp,
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
                        const CardHeader(
                          icon: Icons.arrow_back,
                        ),
                        Text(
                          "Publier un trajet",
                          style: Apptheme.ligthTheme.textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),

                  // Observer les changements d'étape
                  Obx(() {
                    return AnimatedSwitcher(
                      duration: const Duration(seconds: 2),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: controller.currentStep.value == 1
                          ? SizedBox(
                              height: 68.0.hp,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                key: const ValueKey(1),
                                children: [
                                  const HearderFirstSection(
                                    actions: "Specifiez votre trajet !",
                                  ),
                                  const Search(),
                                  FeaturesFirstSection(),
                                ],
                              ),
                            )
                          : SizedBox(
                              height: 65.0.hp,
                              child: const Column(
                                key: ValueKey(2),
                                children: [
                                  HeaderSecondSection(),
                                  SizedBox(height: 10), // Ou tout autre widget
                                  FeatureSecondSection(),
                                ],
                              ),
                            ),
                    );
                  }),

                  // Boutons en bas
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
                          onPressed: () => controller.previousStep(),
                        ),
                        Obx(() => controller.currentStep.value == 1
                            ? ButtonsFormulaire(
                                title: "Suivant",
                                backgroundColor: AppColors.primaryColor,
                                forgroundColor: AppColors.white,
                                borderColor: Colors.transparent,
                                onPressed: () => controller.nextStep(),
                              )
                            : ButtonsFormulaire(
                                title: "Publier",
                                backgroundColor: AppColors.primaryColor,
                                forgroundColor: AppColors.white,
                                borderColor: Colors.transparent,
                                onPressed: () => NavigationHelper
                                    .navigateToSuccesOrFailedPage(
                                        context,
                                        LoaderPage(
                                          actions: "Trajet publié!",
                                          transition: () => NavigationHelper
                                              .navigateWithFadeInWithBack(
                                            context,
                                            EditerPublicationBinding(),
                                            const EditerPublicationView(),
                                          ),
                                        )),
                              )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
