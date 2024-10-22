import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/buttons_formulaire.dart';

class OptionsPayment extends StatelessWidget {
  const OptionsPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36.0.wp,
      child: const ButtonsFormulaire(
        title: "Passer au payment",
        forgroundColor: AppColors.textPlaceholderColor,
        backgroundColor: Colors.white,
        borderColor: AppColors.textPlaceholderColor,
        verticalPadding: 8.0,
        horizontalPadding: 8.0,
      ),
    );
  }
}
