import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/card_formulaire.dart';
import 'package:tripee/app/core/widgets/drop_down_customized.dart';
import 'package:tripee/app/data/models/response_publication_trajet_model.dart';
import 'package:tripee/app/modules/confirm_order/controllers/confirm_order_controller.dart';

class Featuresorder extends StatelessWidget {
  final double horizontalPadding;
  final double width;
 final ResponsePublicationTrajetModel? responsePublicationTrajetModel;

  Featuresorder(
      {super.key,
      this.horizontalPadding = 5.5,
      this.width = 100.0,
      this.responsePublicationTrajetModel});
  final controller = Get.put(ConfirmOrderController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding.wp),
      width: width.wp,
      child: Column(
        children: [
          CardFormulaire(
              title: "Date de départ",
              widget_1: SizedBox(
                width: 24.0.wp,
                child: Center(
                  child: Text(
                    responsePublicationTrajetModel!.departureDate.toString(),
                    style: Apptheme.ligthTheme.textTheme.titleSmall!
                        .copyWith(color: AppColors.textPlaceholderColor),
                  ),
                ),
              ),
              widget_2: const SizedBox()),
          CardFormulaire(
              title: "Heure de depart",
              widget_1: SizedBox(
                width: 24.0.wp,
                child: Center(
                  child: Text(
                    responsePublicationTrajetModel!.departureTime.toString(),
                    style: Apptheme.ligthTheme.textTheme.titleSmall!
                        .copyWith(color: AppColors.textPlaceholderColor),
                  ),
                ),
              ),
              widget_2: const SizedBox()),
          CardFormulaire(
              title: "Places démandées",
              widget_1: Obx(
                () => DropDownCustomized(
                    width: 22.0,
                    itemsList: controller.nombrePlaces,
                    seletedItem: controller.selectednombrePlaces.value,
                    updateSelectedItem: (p0) {
                      controller.updateSelectedItemPlace(
                        p0!,
                        controller.selectednombrePlaces,
                      );
                      controller.calculateTotalAmount(
                          responsePublicationTrajetModel!.price);
                    }),
              ),
              widget_2: const SizedBox()),
          CardFormulaire(
              title: "Bagages",
              widget_1: Obx(
                () => DropDownCustomized(
                  itemsList: controller.bagages,
                  seletedItem: controller.selectedBagages.value,
                  updateSelectedItem: (p0) =>
                      controller.updateSelectedItemBagages(
                    p0!,
                    controller.selectedBagages,
                  ),
                ),
              ),
              widget_2: const SizedBox()),
          CardFormulaire(
            title: "Prix par place",
            widget_1: Text(
              responsePublicationTrajetModel!.price.toString(),
              style: Apptheme.ligthTheme.textTheme.titleSmall!
                  .copyWith(color: AppColors.textPlaceholderColor),
            ),
            widget_2: const Text("\$CAD"),
          ),
        ],
      ),
    );
  }
}
