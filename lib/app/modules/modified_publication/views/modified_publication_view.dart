import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/modules/publication/views/widgets/features_first_section.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';

import '../controllers/modified_publication_controller.dart';

class ModifiedPublicationView extends GetView<ModifiedPublicationController> {
  const ModifiedPublicationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 96.5.hp,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 5.5.wp, right: 5.5.wp, top: 2.0.hp),
                  width: 65.0.wp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CardHeader(
                        icon: Icons.arrow_back,
                      ),
                      Text(
                        "Modifier un trajet",
                        style: Apptheme.ligthTheme.textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),

                const Search(),
                 FeaturesFirstSection(
                  height: 50,
                ),

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
                          title: "Annuler",
                          backgroundColor: AppColors.white,
                          forgroundColor: AppColors.tertiaryColor,
                          borderColor: AppColors.tertiaryColor,
                          onPressed: () {}),
                      ButtonsFormulaire(
                          title: "Enregistrer modifications",
                          backgroundColor: AppColors.primaryColor,
                          forgroundColor: AppColors.white,
                          borderColor: Colors.transparent,
                          onPressed: () {}),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    ));
  }
}
