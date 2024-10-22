import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardHome extends StatelessWidget {
  final Color cardColor;
  final Color circleAvatarColor;
  final ColorFilter iconColor;
  final String label;
  final String iconName;
  const CardHome(
      {super.key,
      required this.cardColor,
      required this.circleAvatarColor,
      required this.iconColor,
      required this.label,
      required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      margin: const EdgeInsets.only(right: 15.0),
      height: 11.5.hp,
      width: 50.0.wp,
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: circleAvatarColor,
            child: SvgPicture.asset(
              iconName,
              colorFilter: iconColor,
            ),
          ),
          Text(
            label,
            style: Apptheme.ligthTheme.textTheme.titleSmall!
                .copyWith(color: AppColors.white),
          )
        ],
      ),
    );
  }
}
