import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class InfosPayment extends StatelessWidget {
  final String paymentName;
  final String date;
  final String content;
  final String amount;
  final bool state;
  const InfosPayment(
      {super.key,
      required this.paymentName,
      required this.date,
      required this.content,
      required this.amount,
      required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 4.5.wp, right: 4.5.wp, top: 2.0.hp, bottom: 2.0.hp),
      height: 12.0.hp,
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 22.0.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(paymentName,
                  style: Apptheme.ligthTheme.textTheme.titleMedium),
              Text(date, style: Apptheme.ligthTheme.textTheme.bodySmall),
              Text(content,
                  maxLines: 1,
                  style: Apptheme.ligthTheme.textTheme.bodySmall!
                      .copyWith(color: AppColors.textColor)),
            ],
          ),
          Text((state == true) ? '-$amount' : '+$amount',
              style: Apptheme.ligthTheme.textTheme.titleMedium!.copyWith(
                  color: (state == true)
                      ? AppColors.primaryColor
                      : AppColors.textColor))
        ],
      ),
    );
  }
}
