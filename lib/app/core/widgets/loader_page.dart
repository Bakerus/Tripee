import 'package:flutter/material.dart';

import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

class LoaderPage extends StatelessWidget {
  final String actions;

  final void Function() transition;
  const LoaderPage(
      {super.key, required this.actions, required this.transition});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      transition();
    });
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7.0.wp),
          width: 100.0.wp,
          height: 23.0.hp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(alignment: Alignment.center, children: [
                Container(
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor, shape: BoxShape.circle),
                  height: 110,
                  width: 110,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                      shape: BoxShape.circle),
                  child: Icon(
                    size: 22.0.sp,
                    Icons.check,
                    color: AppColors.white,
                  ),
                ),
              ]),
              Column(
                children: [
                  Text("Action Réussie",
                      style: Apptheme.ligthTheme.textTheme.bodyMedium),
                  Text(
                    actions,
                    style: Apptheme.ligthTheme.textTheme.headlineMedium,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
