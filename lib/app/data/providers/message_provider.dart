import 'dart:convert';

import 'package:tripee/app/core/constants/identifiants_connections_to_backend.dart';
import 'package:http/http.dart' as http;
import 'package:tripee/app/data/models/conversation_model.dart';
import 'package:tripee/app/data/models/message_model.dart';

class MessageProvider {
  static String host = IdentifiantsConnectionsToBackend.host;
  static int port = 8080;
  static String path = "conversations";

  postConversation(String convId, int userId, String username,
      int interlocutorId, String interlocutorName,
      {String action = "save"}) async {
    var url =
        Uri(scheme: "http", host: host, port: port, path: "$path/$action");
    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'convId': convId,
            'userId': userId,
            'username': username,
            'interlocutorId': interlocutorId,
            'interlocutorName': interlocutorName,
          }));
      if (response.statusCode == 200) {
      }
      else{
      }
    } catch (e) {
      throw "Exception :$e";
    }
  }

  Future<bool> getCheckConversation(String convId,
      {String action = "exist"}) async {
    var url = Uri(
        scheme: "http", host: host, port: port, path: "/$path/$action/$convId");
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        return bool.parse(response.body);
      } else {
        return bool.parse(response.body);
      }
    } catch (e) {
      throw "Exception :$e";
    }
  }

  List<Message> parseInfosContent({required String responseBody}) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Message>((json) => Message.fromJson(json)).toList();
  }

  Future<List<Message>> getContentConversation(String convId,
      {String action = "chat"}) async {
    var url = Uri(
        scheme: "http",
        host: host,
        port: port,
        path: "$action/conversation/$convId");
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        return parseInfosContent(responseBody: response.body);
      } else {
        return parseInfosContent(responseBody: response.body);
      }
    } catch (e) {
      throw "Exception :$e";
    }
  }

  List<ConversationModel> parseInfosConversation(
      {required String responseBody}) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ConversationModel>((json) => ConversationModel.fromJson(json))
        .toList();
  }

  Future<List<ConversationModel>> getAllConversation(String userId,
      {String action = "user"}) async {
    var url = Uri(
        scheme: "http", host: host, port: port, path: "$path/$action/$userId");
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        return parseInfosConversation(responseBody: response.body);
      } else {
        return parseInfosConversation(responseBody: response.body);
      }
    } catch (e) {
      throw "Exception :$e";
    }
  }
}
