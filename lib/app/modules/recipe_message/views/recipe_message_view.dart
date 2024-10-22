import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/modules/recipe_message/views/widgets/info_message.dart';

import '../controllers/recipe_message_controller.dart';

class RecipeMessageView extends GetView<RecipeMessageController> {
  const RecipeMessageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vos Messages',
              style: Apptheme.ligthTheme.textTheme.headlineMedium),
          centerTitle: false,
        ),
        body: const Column(
          children: [
            InfoMessage(
              contactName: "BAKEHE WILLIAM",
              title: "Nouveau message",
              content:
                  "Bonjour je peux passer vous prendre toute de suite à votre entre",
              dateReception: "31/10/2024",
              state: false,
            ),
          ],
        ));
  }
}
