import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/card_formulaire.dart';
import 'package:tripee/app/core/widgets/textfield_formulaire.dart';
import 'package:tripee/app/modules/expedition/controllers/expedition_controller.dart';

class FeaturesExpedition extends StatelessWidget {
  FeaturesExpedition({super.key});

  final controller = Get.put(ExpeditionController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.5.wp),
      height: 40.0.hp,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 50.0.hp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardFormulaire(
                  title: "Date de départ",
                  widget_1: Obx(
                    () => Text(
                      "${controller.selectedDate.value.day} - ${controller.selectedDate.value.month} - ${controller.selectedDate.value.year}",
                      style: Apptheme.ligthTheme.textTheme.titleSmall,
                    ),
                  ),
                  widget_2: Container(
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
                  )),
              const CardFormulaire(
                title: "Volume",
                widget_1: TextfieldFormulaire(
                  keyboardType: TextInputType.number,
                  hintText: "20",
                ),
                widget_2: Text("m3"),
              ),
              const CardFormulaire(
                title: "Poids",
                widget_1: TextfieldFormulaire(
                  keyboardType: TextInputType.number,
                  hintText: "20",
                ),
                widget_2: Text("Kg"),
              ),
              const CardFormulaire(
                title: "Prix par kg",
                widget_1: TextfieldFormulaire(
                  keyboardType: TextInputType.number,
                  hintText: "20",
                ),
                widget_2: Text("CAD"),
              ),
              CardFormulaire(
                  width: 35.0,
                  title: "Nom du destinataire",
                  widget_1: SizedBox(
                    width: 30.0.wp,
                    child: const Center(
                      child: TextfieldFormulaire(
                        width: 20.0,
                        keyboardType: TextInputType.text,
                        hintText: "Alain Parker",
                      ),
                    ),
                  ),
                  widget_2: const SizedBox()),
              CardFormulaire(
                  width: 40.0,
                  title: "Email du destinataire",
                  widget_1: SizedBox(
                    width: 32.0.wp,
                    child: const Center(
                      child: TextfieldFormulaire(
                        width: 45.0,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "alaiparker@gmail.com",
                      ),
                    ),
                  ),
                  widget_2: const SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
