import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';

class TransporteurView extends StatelessWidget {
  const TransporteurView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.0.hp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Trajet prévu du',
              style: Apptheme.ligthTheme.textTheme.headlineSmall),
          const Search(
            horizontalMarging: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 35.0.wp,
                child: const ButtonsFormulaire(
                  title: 'Récuperer le colis',
                  borderColor: Colors.transparent,
                  backgroundColor: AppColors.primaryColor,
                  forgroundColor: AppColors.white,
                  horizontalPadding: 3.0,
                  verticalPadding: 11,
                ),
              ),
              SizedBox(
                width: 37.0.wp,
                child: const ButtonsFormulaire(
                    title: 'Passer au payement',
                    borderColor: AppColors.textPlaceholderColor,
                    backgroundColor: Colors.transparent,
                    forgroundColor: AppColors.textPlaceholderColor,
                    horizontalPadding: 3.0,
                    verticalPadding: 11),
              )
            ],
          ),
        ],
      ),
    );
  }
}
