import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';

class OptionsPostPublication extends StatelessWidget {
  const OptionsPostPublication({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 34.0.wp,
          child: const ButtonsFormulaire(
            title: "Lancer le trajet",
            forgroundColor: AppColors.white,
            backgroundColor: Colors.lightBlueAccent,
            borderColor: Colors.transparent,
            verticalPadding: 8.0,
            horizontalPadding: 8.0,
          ),
        ),
        SizedBox(
          width: 34.0.wp,
          child: const ButtonsFormulaire(
            title: "Terminer le trajet",
            forgroundColor: AppColors.textPlaceholderColor,
            backgroundColor: Colors.white,
            borderColor: AppColors.textPlaceholderColor,
            verticalPadding: 8.0,
            horizontalPadding: 8.0,
          ),
        )
      ],
    );
  }
}
