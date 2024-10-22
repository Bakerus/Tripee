import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class HearderFirstSection extends StatelessWidget {
  final String actions;
  const HearderFirstSection({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0.wp,
      height: 7.0.hp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Hello, Mederos"),
          Text(
            actions,
            style: Apptheme.ligthTheme.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
