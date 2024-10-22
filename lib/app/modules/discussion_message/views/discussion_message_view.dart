import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/widgets/card_header.dart';
import 'package:tripee/app/modules/discussion_message/views/widgets/bubble_message_receved.dart';
import 'package:tripee/app/modules/discussion_message/views/widgets/bubble_message_send.dart';

import '../controllers/discussion_message_controller.dart';

class DiscussionMessageView extends GetView<DiscussionMessageController> {
  const DiscussionMessageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            padding: EdgeInsets.only(right: 40.0.wp),
            width: 100.0.wp,
            height: 10.0.hp,
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CardHeader(
                  icon: Icons.arrow_back,
                ),
                Text('Bakehe William',
                    style: Apptheme.ligthTheme.textTheme.headlineMedium),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 5.5.wp, vertical: 2.0.hp),
              child: const Column(
                children: [
                  BubbleMessageSend(
                    message: "Hello",
                    hours: '10:30',
                  ),
                  BubbleMessageReceved(
                    message: "Hi",
                    hours: "20:30",
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 1.5.hp),
              // La hauteur est supprimée pour permettre un ajustement dynamique
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.emoji_emotions,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  fillColor: AppColors.white,
                  filled: true,
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintStyle: Apptheme.ligthTheme.textTheme.bodyMedium,
                  hintText: "Entrer votre message",
                ),
                minLines: 1,
                maxLines: null,
                expands: false,
              ),
            )
          ],
        ),
      )),
    );
  }
}
