import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class TextfieldLoginAndSignup extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final Function(String) onChanged;

  const TextfieldLoginAndSignup({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 6.3.hp,
          child: TextFormField(
            onChanged: onChanged,
            decoration: InputDecoration(
              fillColor: AppColors.grayColor,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: AppColors.borderColor)),
              hintStyle: Apptheme.ligthTheme.textTheme.bodyMedium,
              hintText: hintText,
            ),
          ),
        ),
        if (errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Text(
              errorText!,
              style: Apptheme.ligthTheme.textTheme.titleSmall!
                  .copyWith(color: AppColors.redColor),
            ),
          ),
      ],
    );
  }
}
