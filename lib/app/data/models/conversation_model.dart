class ConversationModel {
  final String convId;
  final int userId;
  final String username;
  final int interlocutorId;
  final String interlocutorName;
  final int id;

  const ConversationModel({
    required this.convId,
    required this.userId,
    required this.username,
    required this.interlocutorId,
    required this.interlocutorName,
    required this.id,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        convId: json["convId"],
        userId: json["userId"],
        username: json["username"],
        interlocutorId: json["interlocutorId"],
        interlocutorName: json["interlocutorName"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "convId": convId,
        "userId": userId,
        "username": username,
        "interlocutorId": interlocutorId,
        "interlocutorName": interlocutorName,
        "id": id
      };
}
