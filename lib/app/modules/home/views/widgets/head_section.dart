import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/widgets/card_header.dart';

class HeadSection extends StatelessWidget {
  const HeadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Mederos",
              style: Apptheme.ligthTheme.textTheme.bodyMedium,
            ),
            Text(
              "Bienvenue !",
              style: Apptheme.ligthTheme.textTheme.headlineMedium!
                  .copyWith(color: AppColors.tertiaryColor),
            )
          ],
        ),
        const CardHeader(
          icon: Icons.menu_rounded,
        ),
      ],
    );
  }
}
