import 'package:flutter/widgets.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/card_formulaire.dart';
import 'package:tripee/app/data/models/response_publication_trajet_model.dart';

class FeatureExpeditionEdit extends StatelessWidget {
 final  ResponsePublicationTrajetModel? responsePublicationTrajet;
  const FeatureExpeditionEdit({super.key, this.responsePublicationTrajet});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    responsePublicationTrajet!.departureDate.toString(),
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
                    responsePublicationTrajet!.departureTime.toString(),
                    style: Apptheme.ligthTheme.textTheme.titleSmall,
                  ),
                ),
              ),
              widget_2: const SizedBox()),
          // CardFormulaire(
          //     title: "Bagages",
          //     widget_1: SizedBox(
          //       width: 24.0.wp,
          //       child: Center(
          //         child: Text(
          //           responsePublicationTrajet. ,
          //           style: Apptheme.ligthTheme.textTheme.titleSmall,
          //         ),
          //       ),
          //     ),
          //     widget_2: const SizedBox()),
          CardFormulaire(
              title: "Expedition des colis",
              widget_1: SizedBox(
                width: 24.0.wp,
                child: Center(
                  child: Text(
                    responsePublicationTrajet!.doExpedition.toString(),
                    style: Apptheme.ligthTheme.textTheme.titleSmall,
                  ),
                ),
              ),
              widget_2: const SizedBox()),
          CardFormulaire(
            title: "Volume maximal",
            widget_1: Text(
              responsePublicationTrajet!.maxWeight.toString(),
              style: Apptheme.ligthTheme.textTheme.titleSmall,
            ),
            widget_2: const Text("m3"),
          ),
        ],
      ),
    );
  }
}
