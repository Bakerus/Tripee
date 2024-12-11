import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class DialogError extends StatelessWidget {
  final String title;
  final String describe;
  const DialogError(
      {super.key, required this.title, required this.describe});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: AppColors.white,
      content: SizedBox(
        height: 30.0.hp,
        width: 70.0.wp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.backgroundColor,
              radius: 40.0.sp,
              child: Icon(
                Icons.close,
                color: AppColors.redColor,
                size: 40.0.sp,
              ),
            ),
            SizedBox(
              height: 8.0.hp,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: Apptheme.ligthTheme.textTheme.headlineMedium!
                          .copyWith(
                        color: AppColors.redColor,
                      )),
                  Text(describe,
                      textAlign: TextAlign.center,
                      style: Apptheme.ligthTheme.textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
