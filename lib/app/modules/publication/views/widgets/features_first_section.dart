import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/card_formulaire.dart';
import 'package:tripee/app/core/widgets/drop_down_customized.dart';
import 'package:tripee/app/core/widgets/textfield_formulaire.dart';
import 'package:tripee/app/modules/publication/controllers/publication_controller.dart';

class FeaturesFirstSection extends StatelessWidget {
  final double height;
  FeaturesFirstSection({super.key, this.height = 40.0});
  final controller = Get.put(PublicationController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.5.wp),
      height: height.hp,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 54.0.hp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardFormulaire(
                  title: "Date de départ",
                  widget_1: Obx(
                    () => Text(
                      "${controller.selectedDate.value.day}-${controller.selectedDate.value.month}-${controller.selectedDate.value.year}",
                      style: Apptheme.ligthTheme.textTheme.titleSmall,
                    ),
                  ),
                  widget_2: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050));
                      if (pickedDate != null &&
                          pickedDate != controller.selectedDate.value) {
                        controller.selectedDate.value = pickedDate;
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 1.5.wp),
                      width: 3.0.wp,
                      child: IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2050));
                          if (pickedDate != null &&
                              pickedDate != controller.selectedDate.value) {
                            controller.selectedDate.value = pickedDate;
                          }
                        },
                        icon: Icon(
                          Icons.date_range_rounded,
                          color: AppColors.textSecondaryColor,
                          size: 11.0.sp,
                        ),
                      ),
                    ),
                  )),
              CardFormulaire(
                  title: "Heure de depart",
                  widget_1: Obx(
                    () => Text(
                      " ${controller.selectedTime.value.hour} : ${controller.selectedTime.value.minute} ",
                      style: Apptheme.ligthTheme.textTheme.titleSmall,
                    ),
                  ),
                  widget_2: GestureDetector(
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: controller.selectedTime.value);
                      if (pickedTime != null) {
                        controller.selectedTime.value = pickedTime;
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 1.5.wp),
                      width: 3.0.wp,
                      child: IconButton(
                        onPressed: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: controller.selectedTime.value);
                          if (pickedTime != null) {
                            controller.selectedTime.value = pickedTime;
                          }
                        },
                        icon: Icon(
                          Icons.timelapse_rounded,
                          color: AppColors.textSecondaryColor,
                          size: 11.0.sp,
                        ),
                      ),
                    ),
                  )),
              CardFormulaire(
                title: "Nombre de places",
                padding: 2.0,
                widget_1: Obx(
                  () => DropDownCustomized(
                    width: 22.0,
                    itemsList: controller.nombrePlaces,
                    seletedItem: controller.selectednombrePlaces.value,
                    updateSelectedItem: (p0) => controller.updateSelectedItem(
                      p0,
                      controller.selectednombrePlaces,
                    ),
                  ),
                ),
                widget_2: const SizedBox(),
              ),
              CardFormulaire(
                title: "Vous expediez des colis",
                widget_1: Obx(
                  () => DropDownCustomized(
                    itemsList: controller.colis,
                    seletedItem: controller.selectedColis.value,
                    updateSelectedItem: (p0) => controller.updateSelectedItem(
                      p0,
                      controller.selectedColis,
                    ),
                  ),
                ),
                widget_2: const SizedBox(),
              ),
              CardFormulaire(
                title: "Volume maximal",
                widget_1: TextfieldFormulaire(
                  onChanged: (p0) => controller.weight.value = p0,
                  keyboardType: TextInputType.number,
                  hintText: "20",
                ),
                widget_2: const Text("m3"),
              ),
              CardFormulaire(
                title: "Prix unitaire",
                widget_1: TextfieldFormulaire(
                  onChanged: (p0) => controller.price.value = p0,
                  keyboardType: TextInputType.number,
                  hintText: "1500",
                ),
                widget_2: const Text("CAD"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
