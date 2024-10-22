import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/card_formulaire.dart';

class FeaturesCheckOrder extends StatelessWidget {
  final double horizontalPadding;
  final double width;
  const FeaturesCheckOrder(
      {super.key, this.horizontalPadding = 5.5, this.width = 100.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 2.5.wp),
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
                    "02/10/2024",
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
                    "10h00",
                    style: Apptheme.ligthTheme.textTheme.titleSmall!
                        .copyWith(color: AppColors.textPlaceholderColor),
                  ),
                ),
              ),
              widget_2: const SizedBox()),
          CardFormulaire(
              title: "Places démandées",
              widget_1: SizedBox(
                width: 24.0.wp,
                child: Center(
                  child: Text(
                    "2 places",
                    style: Apptheme.ligthTheme.textTheme.titleSmall!
                        .copyWith(color: AppColors.textPlaceholderColor),
                  ),
                ),
              ),
              widget_2: const SizedBox()),
          CardFormulaire(
              title: "Bagages",
              widget_1: SizedBox(
                width: 24.0.wp,
                child: Center(
                  child: Text(
                    "Sans",
                    style: Apptheme.ligthTheme.textTheme.titleSmall!
                        .copyWith(color: AppColors.textPlaceholderColor),
                  ),
                ),
              ),
              widget_2: const SizedBox()),
          CardFormulaire(
            title: "Prix",
            widget_1: Text(
              "20",
              style: Apptheme.ligthTheme.textTheme.titleSmall!
                  .copyWith(color: AppColors.textPlaceholderColor),
            ),
            widget_2: const Text("CAD"),
          ),
        ],
      ),
    );
  }
}
