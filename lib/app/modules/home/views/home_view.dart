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
        automaticallyImplyLeading: false,
        surfaceTintColor: AppColors.white,
        title: HeadSection(),
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
                  //This section correspond to part of home page that will show the infromation about amount wallet and ranking of user but for this version we don't implement this fuctionnality
                ],
              ),
            ),
            SearchSection(),
            const ActionsSections(),
            Container(
              height: 8.0.hp,
              width: 100.0.wp,
              margin: EdgeInsets.symmetric(horizontal: 7.0.wp),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
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
            const CardProximitiSection(), //this section correspond to part of home page that will show the proximiti of user position (with a list of card) but for this version we don't implement this fuctionnality
            const CardProximitiSection() //this section correspond to part of home page that will show the proximiti of user position (with a list of card) but for this version we don't implement this fuctionnality
          ],
        ),
      ),
    ));
  }
}
