import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/modules/recipe_payment/controllers/recipe_payment_controller.dart';

class SortBottomSheet extends StatelessWidget {
  SortBottomSheet({super.key});
  final controller = Get.put(RecipePaymentController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 1.0.hp),
      width: 100.0.wp,
      height: 30.0.hp,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20), // Couleur de l'ombre
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, -3), // Décalage de l'ombre vers le haut
          ),
        ],
      ),
      child: SizedBox(
        height: 10.0.hp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_drop_up),
              ],
            ),
            Text('Trier', style: Apptheme.ligthTheme.textTheme.headlineSmall),
            Obx(() => RadioListTile(
                  title: Text('Plus recent',
                      style: Apptheme.ligthTheme.textTheme.titleMedium!
                          .copyWith(
                              color: AppColors.textSecondaryColor,
                              fontWeight: FontWeight.w400)),
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: 0),
                  contentPadding: EdgeInsets.zero,
                  value: controller.sortMethod[0],
                  groupValue: controller.selectedSortMethod.value,
                  onChanged: (val) {
                    controller.updateSelectedSortMethod(val!);
                  },
                )),
            Obx(() => RadioListTile(
                  title: Text('Plus ancien',
                      style: Apptheme.ligthTheme.textTheme.titleMedium!
                          .copyWith(
                              color: AppColors.textSecondaryColor,
                              fontWeight: FontWeight.w400)),
                  visualDensity: const VisualDensity(
                      horizontal: -4, vertical: 0), // Réduire l'espace
                  contentPadding: EdgeInsets.zero,
                  value: controller.sortMethod[1],
                  groupValue: controller.selectedSortMethod.value,
                  onChanged: (val) {
                    controller.updateSelectedSortMethod(val!);
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 43.0.wp,
                  child: const ButtonsFormulaire(
                      title: "Reinitialiser",
                      borderColor: Colors.transparent,
                      backgroundColor: AppColors.borderColor,
                      forgroundColor: AppColors.textSecondaryColor),
                ),
                SizedBox(
                  width: 43.0.wp,
                  child: const ButtonsFormulaire(
                      title: "Trier",
                      borderColor: Colors.transparent,
                      backgroundColor: AppColors.primaryColor,
                      forgroundColor: AppColors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
