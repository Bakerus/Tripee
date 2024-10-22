import 'package:flutter/widgets.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/card_formulaire.dart';

class FeatureExpeditionEdit extends StatelessWidget {
  const FeatureExpeditionEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 2.5.wp),
      padding: EdgeInsets.symmetric(horizontal: 5.5.wp),
      width: 100.0.wp,
      child: Column(
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
                    "10h00",
                    style: Apptheme.ligthTheme.textTheme.titleSmall,
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
                    "02/10/2024",
                    style: Apptheme.ligthTheme.textTheme.titleSmall,
                  ),
                ),
              ),
              widget_2: const SizedBox()),
          CardFormulaire(
              title: "Expedition des colis",
              widget_1: SizedBox(
                width: 24.0.wp,
                child: Center(
                  child: Text(
                    "Oui",
                    style: Apptheme.ligthTheme.textTheme.titleSmall,
                  ),
                ),
              ),
              widget_2: const SizedBox()),
          CardFormulaire(
            title: "Volume maximal",
            widget_1: Text(
              "20",
              style: Apptheme.ligthTheme.textTheme.titleSmall,
            ),
            widget_2: const Text("m3"),
          ),
        ],
      ),
    );
  }
}
