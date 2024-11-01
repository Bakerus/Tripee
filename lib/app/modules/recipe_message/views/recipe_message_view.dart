import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tripee/app/core/design/colors.dart';
import 'package:tripee/app/core/design/themes.dart';
import 'package:tripee/app/core/utils/extesions.dart';
import 'package:tripee/app/modules/recipe_message/views/widgets/info_message.dart';

import '../controllers/recipe_message_controller.dart';

class RecipeMessageView extends GetView<RecipeMessageController> {
  RecipeMessageView({super.key});
  @override
  final controller = Get.put(RecipeMessageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Vos Messages',
            style: Apptheme.ligthTheme.textTheme.headlineMedium),
        centerTitle: false,
      ),
      body: Obx(
        () => (controller.searching.value == false)
            ? const SizedBox.shrink()
            : FutureBuilder(
                future: controller.messageList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 6,
                      color: AppColors.primaryColor,
                    ));
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.backgroundColor,
                            radius: 40.0.sp,
                            child: Icon(
                              Icons.close,
                              color: AppColors.redColor,
                              size: 40.0.sp,
                            ),
                          ),
                          const Text("Aucune discussion"),
                        ],
                      ),
                    );
                  } else {
                    final messages = snapshot.data;
                    return ListView.builder(
                      itemCount: messages!.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return InfoMessage(
                          contactName: message.interlocutorName,
                          convId: message.convId,
                          receiverId: message.interlocutorId,
                          senderId: message.userId,
                          userName: message.interlocutorName,
                        );
                      },
                    );
                  }
                }),
      ),
    );
  }
}
