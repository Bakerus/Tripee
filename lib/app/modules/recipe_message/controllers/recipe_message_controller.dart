import 'dart:convert';

import 'package:get/get.dart';
import 'package:tripee/app/data/models/conversation_model.dart';
import 'package:tripee/app/data/providers/message_provider.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class RecipeMessageController extends GetxController {
  Future<List<ConversationModel>>? messageList;
  MessageProvider messageProvider = MessageProvider();
  final searching = false.obs;
  Map<String, dynamic>? userInfo;
  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
    await fethAllConversations(userInfo!["userId"]);
  }

  fethAllConversations(String userId) {
    messageList = messageProvider.getAllConversation(userId);
    if (messageList != null) {
      searching.value = true;
    }
  }

  Future<Map<String, dynamic>?> readUserInformations() async {
    final jsonString = await LocalFileServices().readFromFile();
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }
}
