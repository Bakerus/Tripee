import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class CardFormulaire extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final double padding;
  final Widget widget_1;
  final Widget widget_2;
  const CardFormulaire(
      {super.key,
      required this.title,
      this.width = 28.0,
      this.height = 4.8,
      this.padding = 2.0,
      required this.widget_1,
      required this.widget_2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0.wp),
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Apptheme.ligthTheme.textTheme.titleMedium,
          ),
          SizedBox(
              width: width.wp,
              height: height.hp,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: padding.wp),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 0.05),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [widget_1, widget_2],
                ),
              ))
        ],
      ),
    );
  }
}
