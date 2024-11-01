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
  final String userName;
  final int receiverId;
  final int senderId;
  final String convId;
  const DiscussionMessageView(
      {super.key,
      this.userName = '',
      this.receiverId = 0,
      this.senderId = 0,
      this.convId = ''});

  @override
  Widget build(BuildContext context) {
    controller.fetchContentMessages(convId);
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
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const CardHeader(
                    icon: Icons.arrow_back,
                  ),
                ),
                Text(userName,
                    style: Apptheme.ligthTheme.textTheme.headlineMedium),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Obx(
                () => (controller.messages.isEmpty)
                    ? const Text("No messages")
                    : ListView.builder(
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          final message = controller.messages[index];
                          final isSender = message.senderId ==
                              int.parse(controller.userInfo!["userId"]);
                          return isSender
                              ? BubbleMessageSend(
                                  message: message.content,
                                  hours: message.sendingTime,
                                )
                              : (message.senderId == receiverId)
                                  ? BubbleMessageReceved(
                                      message: message.content,
                                      hours: message.sendingTime,
                                    )
                                  : const SizedBox.shrink();
                        },
                      ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 1.5.hp),
              child: TextField(
                controller: controller.messageController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => controller.sendMessages(
                        receiverId: receiverId, convId: convId),
                    icon: const Icon(
                      Icons.send,
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
