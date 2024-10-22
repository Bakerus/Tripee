import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';

import 'package:tripee/app/modules/home/views/widgets/actions_sections.dart';
import 'package:tripee/app/modules/home/views/widgets/card_proximiti_section.dart';
import 'package:tripee/app/modules/home/views/widgets/head_section.dart';
import 'package:tripee/app/modules/home/views/widgets/search_section.dart';
import 'package:tripee/app/modules/home/views/widgets/wallet_section.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        forceMaterialTransparency: true,
        title: const HeadSection(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: AppColors.white,
              height: 28.5.hp,
              padding:
                  EdgeInsets.symmetric(horizontal: 5.5.wp, vertical: 2.0.hp),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WalletSection(),
                ],
              ),
            ),
            SearchSection(),
            const ActionsSections(),
            Container(
              height: 8.0.hp,
              width: 100.0.wp,
              margin: EdgeInsets.symmetric(horizontal: 7.0.wp),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Tripees, disponibles prés de vous",
                    style: Apptheme.ligthTheme.textTheme.headlineMedium!
                        .copyWith(color: AppColors.tertiaryColor),
                  ),
                ],
              ),
            ),
            const CardProximitiSection(),
            const CardProximitiSection()
          ],
        ),
      ),
    ));
  }
}
