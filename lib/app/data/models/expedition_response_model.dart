class ExpeditionResponseModel {
  final int id;
  final int rideId;
  final String departurePlace;
  final String arrivalPLace;
  final String expeditionDate;
  final String expeditionTime;
  final double price;
  final String emailToContact;
  final String expeditionStatus;
  final Packet packet;
  final User user;
  ExpeditionResponseModel(
      {required this.id,
      required this.rideId,
      required this.departurePlace,
      required this.arrivalPLace,
      required this.expeditionDate,
      required this.expeditionTime,
      required this.price,
      required this.emailToContact,
      required this.expeditionStatus,
      required this.packet,
      required this.user});

  factory ExpeditionResponseModel.fromJson(Map<String, dynamic> json) =>
      ExpeditionResponseModel(
        id: json["id"],
        rideId: json["rideId"],
        departurePlace: json["departurePlace"],
        arrivalPLace: json["arrivalPLace"],
        expeditionDate: json["expeditionDate"],
        expeditionTime: json["expeditionTime"],
        price: json["price"],
        emailToContact: json["emailToContact"],
        packet: Packet.fromJson(json["packet"]),
        expeditionStatus: json["expeditionStatus"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "expeditionDate": expeditionDate,
        "expeditionTime": expeditionTime,
        "price": price,
        "emailToContact": emailToContact,
        "packet": packet,
        "expeditionStatus": expeditionStatus,
        "user": user,
      };
}

class Packet {
  final int id;
  final String description;
  final double weight;
  final double length;
  final double width;
  final double height;

  Packet({
    required this.id,
    required this.description,
    required this.weight,
    required this.length,
    required this.width,
    required this.height,
  });

  factory Packet.fromJson(Map<String, dynamic> json) {
    return Packet(
      id: json['id'],
      description: json['description'] ?? '',
      weight: json['weight'] ?? 0,
      length: json['length'] ?? 0,
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'weight': weight,
      'length': length,
      'width': width,
      'height': height,
    };
  }
}

class User {
  int id;
  String email;
  String phoneNumber;

  User({
    required this.id,
    required this.email,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      email: json["email"] ?? '' ?? '', // Default to an empty string if null
      phoneNumber:
          json["phoneNumber"] ?? '' ?? '', // Default to an empty string if null
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'phoneNumber': phoneNumber,
      };
}
