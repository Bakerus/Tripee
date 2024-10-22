import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class HeaderSecondSection extends StatelessWidget {
  const HeaderSecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0.wp,
      height: 7.0.hp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Permettez au client d'avoir"),
          Text(
            "Plus d'informations sur vous",
            style: Apptheme.ligthTheme.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
