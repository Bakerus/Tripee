import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class TextfieldFormulaire extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final double width;
  const TextfieldFormulaire(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      this.width = 15.0,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.wp,
      child: TextField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.all(0),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: Apptheme.ligthTheme.textTheme.titleSmall,
          )),
    );
  }
}
