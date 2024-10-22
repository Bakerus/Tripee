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
  final bool state;
  const InfoMessage(
      {super.key,
      required this.contactName,
      required this.title,
      required this.content,
      required this.dateReception,
      required this.state});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationHelper.navigateWithFadeWithtBack(
          context, DiscussionMessageBinding(), const DiscussionMessageView()),
      child: Container(
        padding: EdgeInsets.only(
            left: 2.0.wp, right: 4.5.wp, top: 2.0.hp, bottom: 2.0.hp),
        height: 12.0.hp,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
