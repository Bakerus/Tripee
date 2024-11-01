import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class Options extends StatelessWidget {
  final String title;
  const Options({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.5.wp),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.textPlaceholderColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ],
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      height: 6.5.hp,
      width: 90.0.wp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Apptheme.ligthTheme.textTheme.titleMedium,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 13.0.sp,
            color: AppColors.textSecondaryColor,
          )
        ],
      ),
    );
  }
}
//Customize widget create to show option and more informations about the user epplication