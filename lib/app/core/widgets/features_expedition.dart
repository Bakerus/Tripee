import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          height: 60.0.hp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardFormulaire(
                title: "Longuer",
                widget_1: TextfieldFormulaire(
                  onChanged: (p0) => controller.packeLength.value = p0,
                  keyboardType: TextInputType.number,
                  hintText: "0",
                ),
                widget_2: const Text("m"),
              ),
              CardFormulaire(
                title: "Largeur du colis",
                widget_1: TextfieldFormulaire(
                  onChanged: (p0) => controller.packeWidth.value = p0,
                  keyboardType: TextInputType.number,
                  hintText: "0",
                ),
                widget_2: const Text("m"),
              ),
              CardFormulaire(
                title: "Hauteur du colis",
                widget_1: TextfieldFormulaire(
                  onChanged: (p0) => controller.packeHeight.value = p0,
                  keyboardType: TextInputType.number,
                  hintText: "0",
                ),
                widget_2: const Text("m"),
              ),
              CardFormulaire(
                title: "Poids",
                widget_1: TextfieldFormulaire(
                  onChanged: (p0) => controller.packeWeight.value = p0,
                  keyboardType: TextInputType.number,
                  hintText: "0",
                ),
                widget_2: const Text("Kg"),
              ),
              CardFormulaire(
                title: "Prix par kg",
                widget_1: TextfieldFormulaire(
                  onChanged: (p0) => controller.packePrice.value = p0,
                  keyboardType: TextInputType.number,
                  hintText: "0",
                ),
                widget_2: const Text("\$CAD"),
              ),
              CardFormulaire(
                  width: 40,
                  title: "Email du destinataire",
                  widget_1: SizedBox(
                    width: 36.0.wp,
                    child: TextfieldFormulaire(
                      onChanged: (p0) =>
                          controller.emailDestinataire.value = p0,
                      keyboardType: TextInputType.text,
                      hintText: "bakehew@gamil.com",
                    ),
                  ),
                  widget_2: const SizedBox()),
              CardFormulaire(
                  width: 62.0,
                  height: 6.0,
                  title: "Desciption",
                  widget_1: SizedBox(
                    width: 57.0.wp,
                    child: TextfieldFormulaire(
                      onChanged: (p0) => controller.packeDescription.value = p0,
                      keyboardType: TextInputType.text,
                      hintText: "",
                    ),
                  ),
                  widget_2: const SizedBox(
                    width: 0,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
