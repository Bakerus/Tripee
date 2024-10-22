import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class BubbleMessageSend extends StatelessWidget {
  final String message;
  final String hours;
  const BubbleMessageSend({super.key, required this.message, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 85.0.wp,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 2.0.wp),
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
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Text(
                    message,
                    style: Apptheme.ligthTheme.textTheme.bodyMedium!
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
