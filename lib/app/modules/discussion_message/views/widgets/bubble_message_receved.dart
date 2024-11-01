import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class BubbleMessageReceved extends StatelessWidget {
  final String message;
  final String hours;
  const BubbleMessageReceved(
      {super.key, required this.message, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 85.0.wp,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 2.0.hp, horizontal: 2.5.wp),
                  margin: EdgeInsets.symmetric(vertical: 2.0.hp),
                  constraints: BoxConstraints(
                    minHeight: 4.0.hp,
                    maxWidth: 65.0.wp,
                  ),
                  decoration: const BoxDecoration(
                      color: AppColors.tertiaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Text(
                    message,
                    style: Apptheme.ligthTheme.textTheme.bodyMedium!
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 2.0.wp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 17.0.sp,
                      backgroundColor: AppColors.textPlaceholderColor,
                    ),
                    Text(
                      hours,
                      style: Apptheme.ligthTheme.textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
