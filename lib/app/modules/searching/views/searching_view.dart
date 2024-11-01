import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';

import '../controllers/searching_controller.dart';

class SearchingView extends GetView<SearchingController> {
  const SearchingView({super.key, this.transition});
  final void Function()? transition;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 6), () {
      transition!();
    });
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30.0.hp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40.0.hp,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(children: [
                    CircleAvatar(
                      radius: 40.0.sp,
                    ),
                    Positioned(
                      top: 8.0.hp,
                      left: 10.0.wp,
                      child: CircleAvatar(
                          backgroundColor: AppColors.darkColor.withOpacity(0.5),
                          radius: 14.0,
                          child: const Icon(
                            size: 14,
                            Icons.search,
                            color: AppColors.white,
                          )),
                    )
                  ]),
                  SizedBox(
                    width: 100.0.wp,
                    height: 7.0.hp,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Veuillez patienter"),
                        Text(
                          "Recherche d'un triper",
                          style: Apptheme.ligthTheme.textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                  const Search(),
                ],
              ),
            ),
            Container(
              width: 100.0.wp,
              height: 2.0.hp,
              color: AppColors.textPlaceholderColor.withOpacity(0.3),
            )
          ],
        ),
      ),
    );
  }
}
