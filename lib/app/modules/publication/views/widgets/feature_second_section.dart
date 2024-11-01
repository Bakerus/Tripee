import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/card_formulaire.dart';
import 'package:tripee/app/core/widgets/textfield_formulaire.dart';
import 'package:tripee/app/modules/publication/controllers/publication_controller.dart';

class FeatureSecondSection extends StatelessWidget {
  const FeatureSecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PublicationController());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.5.wp),
      height: 55.0.hp,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 36.0.hp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardFormulaire(
                title: "Marque du vehicule",
                widget_1: TextfieldFormulaire(
                  onChanged: (p0) => controller.vehicleBrand.value = p0,
                  keyboardType: TextInputType.text,
                  hintText: "Toyota Tundra",
                  width: 20.0,
                ),
                widget_2: const SizedBox(),
              ),
              CardFormulaire(
                title: "Numero d'immatriculation",
                widget_1: TextfieldFormulaire(
                  onChanged: (p0) =>
                      controller.vehicleRegisterNumber.value = p0,
                  keyboardType: TextInputType.text,
                  hintText: "AA89BT",
                ),
                widget_2: const SizedBox(),
              ),
              CardFormulaire(
                height: 15.0,
                padding: 0.0,
                title: "image du vehicule",
                widget_1: SizedBox(
                  height: 15.0.hp,
                  width: 28.0.wp,
                  child: Stack(children: [
                    Obx(() => controller.imagePath.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(
                                        File(controller.imagePath.toString())),
                                    fit: BoxFit.cover)),
                          )
                        : Container()),
                    Positioned(
                        bottom: 9.7.hp,
                        left: 19.5.wp,
                        child: IconButton(
                          onPressed: () => controller.getImage(),
                          icon: Container(
                              padding: EdgeInsets.all(2.0.wp),
                              height: 6.5.hp,
                              decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.photo_camera_outlined,
                                size: 11.0.sp,
                                color: AppColors.darkColor,
                              )),
                        ))
                  ]),
                ),
                widget_2: const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
