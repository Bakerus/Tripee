import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class CardTriper extends StatelessWidget {
  final String id;
  final String name;
  final String phoneNumber;
  final String? imagePath;
  final double bottom;
  final double leftMargin;
  final double rightMargin;
  final void Function()? ontap;
  const CardTriper(
      {super.key,
      this.id = "",
      this.bottom = 1.5,
      this.ontap,
      this.name = "",
      this.phoneNumber = "",
      this.leftMargin = 5.5,
      this.rightMargin = 5.5,
      this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(
            left: 2.0.wp, right: 2.0.wp, top: 1.5.hp, bottom: 1.5.hp),
        margin: EdgeInsets.only(
            left: leftMargin.wp, right: rightMargin.wp, bottom: bottom.hp),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: 50.0.wp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 28.0.sp,
                  backgroundImage: (imagePath != null)
                      ? NetworkImage(imagePath.toString())
                      : const AssetImage('assets/images/placeholder.jpeg'),
                ),
                SizedBox(
                  height: 8.5.hp,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(id,
                          style: Apptheme.ligthTheme.textTheme.titleSmall!
                              .copyWith(color: AppColors.textSecondaryColor)),
                      Text(name,
                          style: Apptheme.ligthTheme.textTheme.titleLarge!
                              .copyWith(color: AppColors.darkColor)),
                      Text(phoneNumber,
                          style: Apptheme.ligthTheme.textTheme.bodyMedium!
                              .copyWith(color: AppColors.darkColor)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 13.0.wp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 8.0.sp,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(Icons.star, size: 11.5.sp),
                ),
                const Row(
                  children: [
                    Text(
                      "-",
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
          ),
        ]),
      ),
    );
  }
}
