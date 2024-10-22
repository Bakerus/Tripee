import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/modules/recipe_payment/controllers/recipe_payment_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({super.key});
  final controller = Get.put(RecipePaymentController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 0.5.hp),
      width: 100.0.wp,
      height: 90.0.hp,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_drop_up),
            ],
          ),
          Text('Filtrer', style: Apptheme.ligthTheme.textTheme.headlineSmall),
          const Text("choisissez l'interval des dates"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date début",
                      style: Apptheme.ligthTheme.textTheme.titleMedium),
                  Container(
                    width: 43.0.wp,
                    height: 5.0.hp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryColor.withOpacity(0.17)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Choisir date"),
                        Icon(
                          Icons.calendar_month,
                          size: 15.0.sp,
                          color: AppColors.textSecondaryColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date fin",
                      style: Apptheme.ligthTheme.textTheme.titleMedium),
                  Container(
                    width: 43.0.wp,
                    height: 5.0.hp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryColor.withOpacity(0.17)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Choisir date"),
                        Icon(
                          Icons.calendar_month,
                          size: 15.0.sp,
                          color: AppColors.textSecondaryColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Obx(
            () => SizedBox(
              height: 28.0.hp,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 4.6.hp,
                    width: 100.0.wp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Checkbox
                        Transform.scale(
                          scale: 1.4,
                          child: Checkbox(
                            hoverColor: AppColors.borderColor,
                            value: controller.selectedCategories
                                .contains(controller.categories[index]),
                            onChanged: (bool? selected) =>
                                controller.toggle(controller.categories[index]),
                            side:
                                const BorderSide(color: AppColors.borderColor),
                          ),
                        ),

                        // Title (le widget CategoryPayment)
                        Expanded(
                            child: Text(controller.categories[index].name,
                                style:
                                    Apptheme.ligthTheme.textTheme.bodySmall)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
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
    );
  }
}
