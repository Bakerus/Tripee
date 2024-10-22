import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class SliderButton extends StatelessWidget {
  final IconData icons;
  const SliderButton({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.0.hp,
      width: 5.0.wp,
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(3))),
      child: Icon(
        icons,
        color: AppColors.white,
      ),
    );
  }
}
