class ReservationResponseModel {
  final int id;
  final int rideId;
  final String departurePlace;
  final String arrivalPLace;
  final String reservationDate;
  final String reservationTime;
  final int reservedPlaces;
  final double price;
  final String reservationStatus;
  final bool hasLuggage;
  UserResponse user;

  ReservationResponseModel(
      {required this.id,
      required this.rideId,
      required this.departurePlace,
      required this.arrivalPLace,
      required this.reservationDate,
      required this.reservationTime,
      required this.reservedPlaces,
      required this.price,
      required this.hasLuggage,
      required this.reservationStatus,
      required this.user});

  factory ReservationResponseModel.fromJson(Map<String, dynamic> json) =>
      ReservationResponseModel(
          id: json["id"],
          rideId: json["rideId"],
          departurePlace: json["departurePlace"],
          arrivalPLace: json["arrivalPLace"],
          reservationDate: json["reservationDate"],
          reservationTime: json["reservationTime"],
          reservedPlaces: json["reservedPlaces"],
          price: json["price"],
          hasLuggage: json["hasLuggage"],
          reservationStatus: json['reservationStatus'],
          user: UserResponse.fromJson(json["user"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "rideId": rideId,
        "departurePlace": departurePlace,
        "arrivalPLace": arrivalPLace,
        "reservationDate": reservationDate,
        "reservationTime": reservationTime,
        "price": price,
        "hasLuggage": hasLuggage,
        "reservationStatus": reservationStatus,
        "user": user,
      };
}

class UserResponse {
  int id;
  String email;
  String phoneNumber;
  String userName;

  UserResponse({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.userName,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json["id"],
      email: json["email"] ?? '' ?? '', // Default to an empty string if null
      phoneNumber:
          json["phoneNumber"] ?? '' ?? '', // Default to an empty string if null
      userName: json["username"] ?? '' ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'phoneNumber': phoneNumber,
        'userName': userName,
      };
}
