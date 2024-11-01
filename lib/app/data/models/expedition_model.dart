class ExpeditionModel {
  final double? price;
  final String? emailToContact;
  final Packet? packet;
  int? userId;
  int? rideId;

  ExpeditionModel({
    this.price,
    this.emailToContact,
    this.packet,
    this.userId,
    this.rideId,
  });

  factory ExpeditionModel.fromJson(Map<String, dynamic> json) {
    return ExpeditionModel(
      price: json['price'] ?? 0,
      emailToContact: json['emailToContact'] ?? '',
      packet: Packet.fromJson(json['packet'] ?? {}),
      userId: json['userId'] ?? 0,
      rideId: json['rideId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'emailToContact': emailToContact,
      'packet': packet?.toJson(),
      'userId': userId,
      'rideId': rideId,
    };
  }
}

class Packet {
  final String description;
  final double weight;
  final double length;
  final double width;
  final double height;

  Packet({
    required this.description,
    required this.weight,
    required this.length,
    required this.width,
    required this.height,
  });

  factory Packet.fromJson(Map<String, dynamic> json) {
    return Packet(
      description: json['description'] ?? '',
      weight: json['weight'] ?? 0,
      length: json['length'] ?? 0,
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'weight': weight,
      'length': length,
      'width': width,
      'height': height,
    };
  }
}
