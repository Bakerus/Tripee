import 'package:flutter/material.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/core/utils/transition_animations.dart';
import 'package:tripee/app/modules/discussion_message/bindings/discussion_message_binding.dart';
import 'package:tripee/app/modules/discussion_message/views/discussion_message_view.dart';

class InfoMessage extends StatelessWidget {
  final String contactName;
  final String title;
  final String content;
  final String dateReception;
  final String convId;
  final int receiverId;
  final int senderId;
  final String userName;
  final bool state;
  const InfoMessage(
      {super.key,
      this.contactName = "",
      this.title = "",
      this.content = "",
      this.dateReception = "",
      this.convId = "",
      this.receiverId = 0,
      this.senderId = 0,
      this.userName = "",
      this.state = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationHelper.navigateWithFadeWithtBack(
          context,
          DiscussionMessageBinding(),
          DiscussionMessageView(
            convId: convId,
            receiverId: receiverId,
            senderId: senderId,
            userName: userName,
          )),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.0.hp),
        padding: EdgeInsets.only(
            left: 2.0.wp, right: 8.5.wp, top: 2.0.hp, bottom: 2.0.hp),
        height: 12.0.hp,
        width: 2.0.wp,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 22.0.sp,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(contactName,
                        style: Apptheme.ligthTheme.textTheme.titleMedium),
                    Text(title, style: Apptheme.ligthTheme.textTheme.bodySmall),
                    SizedBox(
                      width: 55.0.wp,
                      child: Text(content,
                          maxLines: 1,
                          style: Apptheme.ligthTheme.textTheme.bodySmall!
                              .copyWith(color: AppColors.textColor)),
                    ),
                  ],
                ),
                Text(dateReception,
                    style: Apptheme.ligthTheme.textTheme.titleSmall),
              ],
            )
          ],
        ),
      ),
    );
  }
}
