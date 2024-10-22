import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/themes.dart';

class InfosCar extends StatelessWidget {
  final String title;
  final String description;
  const InfosCar({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title , style: Apptheme.ligthTheme.textTheme.bodyMedium),
        Text(description , style: Apptheme.ligthTheme.textTheme.titleMedium)
      ],
    );
  }
}
