import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/core/widgets/card_triper.dart';
import 'package:tripee/app/core/widgets/features_edit_section.dart';
import 'package:tripee/app/modules/publication/views/widgets/search.dart';

class DetailsPublication extends StatelessWidget {
  const DetailsPublication({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 93.0.hp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 5.5.wp, right: 5.5.wp, top: 2.0.hp),
                  width: 82.0.wp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CardHeader(
                        icon: Icons.arrow_back,
                      ),
                      Text(
                        "Detail de la publication",
                        style: Apptheme.ligthTheme.textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                const CardTriper(),
                const Search(),
                const FeaturesEditSection(height: 54.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
