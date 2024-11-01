import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/core/widgets/card_triper.dart';
import 'package:tripee/app/core/widgets/feature_expedition_edit.dart';
import 'package:tripee/app/core/widgets/loader_page.dart';
import 'package:tripee/app/data/models/response_publication_trajet_model.dart';
import 'package:tripee/app/modules/dasboard/bindings/dashboard_binding.dart';
import 'package:tripee/app/modules/dasboard/views/dashboard_view.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';
import 'package:tripee/app/modules/search_result/bindings/search_result_binding.dart';
import 'package:tripee/app/modules/search_result/views/search_result_view.dart';

import '../controllers/edit_expedition_controller.dart';

class EditExpeditionView extends GetView<EditExpeditionController> {
  final ResponsePublicationTrajetModel? responsePublicationTrajet;
  const EditExpeditionView({super.key, this.responsePublicationTrajet});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SafeArea(
        child: SizedBox(
          height: 100.0.hp,
          child: Scaffold(
              body: SingleChildScrollView(
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
                        const CardHeader(
                          icon: Icons.arrow_back,
                        ),
                        Text(
                          "Expedier un colis",
                          style: Apptheme.ligthTheme.textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                  CardTriper(
                    id: responsePublicationTrajet!.user.id.toString(),
                    name: responsePublicationTrajet!.user.userName,
                    phoneNumber:
                        responsePublicationTrajet!.user.phoneNumber.toString(),
                    imagePath: responsePublicationTrajet!.vehicle.imagePath,
                    bottom: 1.0,
                  ),
                  Search(
                    readOnly: controller.reaOnly,
                    initialValueArrive:
                        responsePublicationTrajet!.arrivalPlace.name.toString(),
                    initialValueDepart: responsePublicationTrajet!
                        .departurePlace.name
                        .toString(),
                  ),
                  FeatureExpeditionEdit(
                    responsePublicationTrajet: responsePublicationTrajet,
                  ),
                  Container(
                    width: 100.0.wp,
                    height: 23.0.hp,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total'),
                            Obx(
                              () => Text(
                                  "${controller.totalAmount.value.toString()}\$",
                                  style: Apptheme
                                      .ligthTheme.textTheme.headlineLarge!
                                      .copyWith(color: AppColors.textColor)),
                            )
                          ],
                        ),
                        ButtonsFormulaire(
                          title: "Annuler",
                          backgroundColor: AppColors.white,
                          forgroundColor: AppColors.tertiaryColor,
                          borderColor: AppColors.tertiaryColor,
                          onPressed: () {
                            NavigationHelper.navigateWithFadeInWithBack(
                              context,
                              SearchResultBinding(),
                              const SearchResultView(),
                            );
                          },
                        ),
                        ButtonsFormulaire(
                          title: "Demander l'expedition",
                          backgroundColor: AppColors.tertiaryColor,
                          forgroundColor: AppColors.white,
                          borderColor: Colors.transparent,
                          onPressed: () {
                            controller.getRideInformation(
                              responsePublicationTrajet!.id,
                            );
                            controller.demandExportation(
                                controller.expeditionController.expeditionModel,
                                controller.userInfo!['token']);
                            NavigationHelper.navigateToSuccesOrFailedPage(
                                context,
                                LoaderPage(
                                  actions: "Expedition demandée",
                                  transition: () => NavigationHelper
                                      .navigateWithFadeInWithBack(context,
                                          DashboardBinding(), DashboardView()),
                                ));
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
