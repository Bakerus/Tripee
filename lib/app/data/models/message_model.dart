// Classe pour le modèle de message
class Message {
  final int messageId;
  final int senderId;
  final int receiverId;
  final String convId;
  final String senderName;
  final String receiverName;
  final String content;
  final String sendingTime;
  final String sendingDate;
  final String messageType;
  final String messageStatus;

  Message({
    this.messageId = 0,
    this.senderId = 0,
    this.receiverId = 0,
    this.convId = "",
    this.senderName = "",
    this.receiverName = "",
    this.content = "",
    this.sendingTime = "",
    this.sendingDate = "",
    this.messageType = "",
    this.messageStatus = "",
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        messageId: json['messageId'] ?? '' ?? '',
        senderId: json['senderId'] ?? '' ?? '',
        receiverId: json['receiverId'] ?? '' ?? '',
        convId: json['convId'] ?? '' ?? '',
        senderName: json['senderName'] ?? '' ?? '',
        receiverName: json['receiverName'] ?? '' ?? '',
        content: json['content'] ?? '' ?? '',
        sendingTime: json['sendingTime'] ?? '' ?? '',
        sendingDate: json['sendingDate'] ?? '' ?? '',
        messageType: json['messageType'] ?? '' ?? '',
        messageStatus: json['messageStatus'] ?? '' ?? '',
      );

  Map<String, dynamic> toJson() => {
        'messageId': messageId,
        'senderId': senderId,
        'receiverId': receiverId,
        'convId': convId,
        'senderName': senderName,
        'receiverName': receiverName,
        'content': content,
        'sendingTime': sendingTime,
        'messageType': messageType,
        'messageStatus': messageStatus
      };
}
