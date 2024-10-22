import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class CardTriper extends StatelessWidget {
  final double bottom;
  final void Function()? ontap;
  const CardTriper({super.key, this.bottom = 1.5, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(
            left: 1.3.wp, right: 1.3.wp, top: 1.5.hp, bottom: 1.5.hp),
        margin: EdgeInsets.only(left: 5.5.wp, right: 5.5.wp, bottom: bottom.hp),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CircleAvatar(
            radius: 28.0.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("#7ASHSF",
                  style: Apptheme.ligthTheme.textTheme.titleSmall!
                      .copyWith(color: AppColors.textSecondaryColor)),
              Text("Leilani Angelo",
                  style: Apptheme.ligthTheme.textTheme.titleLarge!
                      .copyWith(color: AppColors.darkColor)),
              Text("leilaniangelo@gmail.com",
                  style: Apptheme.ligthTheme.textTheme.bodyMedium!
                      .copyWith(color: AppColors.darkColor)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 10.0.sp,
                backgroundColor: AppColors.primaryColor,
                child: Icon(Icons.star, size: 11.5.sp),
              ),
              const Row(
                children: [
                  Text(
                    "4",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.darkColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("/5")
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
