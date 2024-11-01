import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/core/widgets/card_triper.dart';
import 'package:tripee/app/modules/edit_expedition/bindings/edit_expedition_binding.dart';
import 'package:tripee/app/modules/edit_expedition/views/edit_expedition_view.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';

import '../controllers/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  const SearchResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 5.5.wp, right: 5.5.wp, top: 2.0.hp),
                width: 75.0.wp,
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
              Search(
                initialValueArrive: controller.lieuArrive.value,
                initialValueDepart: controller.lieuDepart.value,
                readOnly: controller.reaOnly,
              ),
              Container(
                margin: EdgeInsets.only(left: 5.5.wp),
                child: Text(
                  "Résultat des recherches",
                  style: Apptheme.ligthTheme.textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                  height: 62.0.hp,
                  child: FutureBuilder(
                    future: controller.trajectList,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 6,
                          color: AppColors.primaryColor,
                        ));
                      } else if (snapshot.hasError) {
                        return Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.backgroundColor,
                              radius: 40.0.sp,
                              child: Icon(
                                Icons.close,
                                color: AppColors.redColor,
                                size: 40.0.sp,
                              ),
                            ),
                            SizedBox(
                              height: 13.0.hp,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Aucun trajet trouvé",
                                      style: Apptheme
                                          .ligthTheme.textTheme.headlineMedium!
                                          .copyWith(
                                        color: AppColors.redColor,
                                      )),
                                  Text("Aucun trajet trouvé",
                                      textAlign: TextAlign.center,
                                      style: Apptheme
                                          .ligthTheme.textTheme.bodyMedium),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        final trajets = snapshot.data;
                        return ListView.builder(
                          itemCount: trajets!.length,
                          itemBuilder: (context, index) {
                            final trajet = trajets[index];
                            controller.imagePath.value =
                                trajet.vehicle.imagePath;
                            return Obx(
                              () => CardTriper(
                                ontap: () {
                                  NavigationHelper.navigateWithFadeInWithBack(
                                      context,
                                      EditExpeditionBinding(),
                                      EditExpeditionView(
                                        responsePublicationTrajet: trajet,
                                      ));
                                },
                                phoneNumber: trajet.user.phoneNumber,
                                id: trajet.user.id.toString(),
                                name: trajet.user.userName,
                                imagePath: controller.imagePath.value,
                              ),
                            );
                          },
                        );
                      }
                    },
                  )
                  ),
            ]),
      ),
    );
  }
}
