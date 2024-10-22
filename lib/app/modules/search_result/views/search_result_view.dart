import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/core/widgets/card_triper.dart';
import 'package:tripee/app/modules/edit_expedition/bindings/edit_expedition_binding.dart';
import 'package:tripee/app/modules/edit_expedition/views/edit_expedition_view.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';

import '../controllers/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  const SearchResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 5.5.wp, right: 5.5.wp, top: 2.0.hp),
                width: 75.0.wp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CardHeader(
                      icon: Icons.arrow_back,
                    ),
                    Text(
                      "Rechercher un triper",
                      style: Apptheme.ligthTheme.textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              const Search(),
              Container(
                margin: EdgeInsets.only(left: 5.5.wp),
                child: Text(
                  "Résultat des recherches",
                  style: Apptheme.ligthTheme.textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: 62.0.hp,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardTriper(
                        ontap: () => NavigationHelper.navigateWithFadeInWithBack(
                            context,
                            EditExpeditionBinding(),
                            const EditExpeditionView()),
                      ),
                      CardTriper(
                        ontap: () => NavigationHelper.navigateWithFadeInWithBack(
                            context,
                            EditExpeditionBinding(),
                            const EditExpeditionView()),
                      ),
                      CardTriper(
                        ontap: () => NavigationHelper.navigateWithFadeInWithBack(
                            context,
                            EditExpeditionBinding(),
                            const EditExpeditionView()),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
