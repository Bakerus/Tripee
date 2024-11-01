import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'package:tripee/app/core/constants/identifiants_connections_to_backend.dart';
import 'package:tripee/app/data/models/message_model.dart';
import 'package:tripee/app/data/providers/message_provider.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class DiscussionMessageController extends GetxController {
  Map<String, dynamic>? userInfo;
  late StompClient client;
  RxList<Message> messages = <Message>[].obs;
  MessageProvider messageProvider = MessageProvider();
  var sendMessage = ''.obs;
  final convId = ''.obs;
  final TextEditingController messageController = TextEditingController();
  final receverId = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    userInfo = await readUserInformations();
    
    client = StompClient(
        config: StompConfig.sockJS(
      url: 'http://${IdentifiantsConnectionsToBackend.host}:8080/ws',
      onConnect: onConnect,
      stompConnectHeaders: {'Authorization': 'Bearer ${userInfo!["token"]}'},
      webSocketConnectHeaders: {
        'Authorization': 'Bearer ${userInfo!["token"]}'
      },
      onWebSocketError: (dynamic error) => print(error.toString()),
    ));
    client.activate();
  }

//   @override
//   void onReady() {
// fetchContentMessages(convId);
//     super.onReady();
//   }

  void onConnect(StompFrame frame) {
    client.subscribe(
        destination: '/topic/${userInfo!["userId"]}',
        headers: {},
        callback: (frame) {
          if (frame.body != null) {
            final data = jsonDecode(frame.body!);
            final message = Message.fromJson(data);
            messages.add(message);
          }
        });
  }

  void sendMessages({required int receiverId, required String convId}) {
    final content = messageController.text;
    final sendingTime = "${TimeOfDay.now().hour} : ${TimeOfDay.now().minute}";
    if (content.isEmpty) return;
    final message = Message(
      receiverId: receiverId,
      content: content,
      senderId: int.parse(userInfo!["userId"]),
      convId: convId,
      messageType: "CHAT",
      messageStatus: "UNDELIVERED",
      sendingTime: sendingTime,
    );
    client.send(
      destination: "/chat/sendMessage/$receiverId",
      body: jsonEncode(message.toJson()),
    );

    messages.add(message);
    messageController.clear();
  }

  fetchContentMessages(String convId) async {
    messages.value = await messageProvider.getContentConversation(convId);
  }

  Future<Map<String, dynamic>?> readUserInformations() async {
    final jsonString = await LocalFileServices().readFromFile();
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }
}
