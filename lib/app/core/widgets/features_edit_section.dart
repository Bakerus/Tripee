import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/card_formulaire.dart';

class FeaturesEditSection extends StatelessWidget {
  final double height;
  const FeaturesEditSection({super.key, this.height = 40.0});

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
                  widget_1: SizedBox(
                    width: 24.0.wp,
                    child: Center(
                      child: Text(
                        "02/10/2024",
                        style: Apptheme.ligthTheme.textTheme.titleSmall,
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
                        "10h30min",
                        style: Apptheme.ligthTheme.textTheme.titleSmall,
                      ),
                    ),
                  ),
                  widget_2: const SizedBox()),
              CardFormulaire(
                title: "Nombre de places",
                widget_1: SizedBox(
                  width: 24.0.wp,
                  child: Center(
                    child: Text(
                      "3 places",
                      style: Apptheme.ligthTheme.textTheme.titleSmall,
                    ),
                  ),
                ),
                widget_2: const SizedBox(),
              ),
              CardFormulaire(
                title: "Bagages",
                widget_1: SizedBox(
                  width: 24.0.wp,
                  child: Center(
                    child: Text(
                      "Oui",
                      style: Apptheme.ligthTheme.textTheme.titleSmall,
                    ),
                  ),
                ),
                widget_2: const SizedBox(),
              ),
              CardFormulaire(
                title: "Vous expediez des colis",
                widget_1: SizedBox(
                  width: 24.0.wp,
                  child: Center(
                    child: Text(
                      "Oui",
                      style: Apptheme.ligthTheme.textTheme.titleSmall,
                    ),
                  ),
                ),
                widget_2: const SizedBox(),
              ),
              CardFormulaire(
                title: "Volume maximal",
                widget_1: Text(
                  "20",
                  style: Apptheme.ligthTheme.textTheme.titleSmall,
                ),
                widget_2: const Text("m3"),
              ),
              CardFormulaire(
                title: "Prix unitaire",
                widget_1: Text(
                  "1500",
                  style: Apptheme.ligthTheme.textTheme.titleSmall,
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
