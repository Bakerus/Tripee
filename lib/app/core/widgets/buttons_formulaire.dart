import 'package:flutter/material.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class ButtonsFormulaire extends StatelessWidget {
  final String title;
  final double horizontalPadding;
  final double verticalPadding;
  final Color borderColor;
  final Color backgroundColor;
  final Color forgroundColor;
  final void Function()? onPressed;
  const ButtonsFormulaire(
      {super.key,
      required this.title,
      required this.borderColor,
      required this.backgroundColor,
      required this.forgroundColor,
      this.horizontalPadding = 15,
      this.verticalPadding = 17,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0.wp,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding)),
          foregroundColor: WidgetStateProperty.all<Color>(forgroundColor),
          backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
          shape: WidgetStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: borderColor, width: 1.5))),
        ),
        child: Text(title),
      ),
    );
  }
}
