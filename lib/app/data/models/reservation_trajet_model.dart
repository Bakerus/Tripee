class ReservationTrajet {
  final int? id;
  final String? reservationDate;
  final String? reservationTime;
  final int? reservedPlaces;
  final double? price;
  final bool? hasLuggage;
  final String? reservationStatus;
  final int? userId;
  final int? rideId;

  ReservationTrajet({
    this.id,
    this.reservationDate,
    this.reservationTime,
    this.reservedPlaces,
    this.price,
    this.hasLuggage,
    this.reservationStatus,
    this.userId,
    this.rideId,
  });

  factory ReservationTrajet.fromJson(Map<String, dynamic> json) {
    return ReservationTrajet(
        id: json['id'],
        reservationDate: json['reservationDate'],
        reservationTime: json['reservationTime'],
        reservedPlaces: json['reservedPlaces'],
        price: json['price'],
        hasLuggage: json['hasLuggage'],
        reservationStatus: json['reservationStatus'],
        userId: json['userId'],
        rideId: json['rideId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reservationDate': reservationDate,
      'reservationTime': reservationTime,
      'reservedPlaces': reservedPlaces,
      'price': price,
      'hasLuggage': hasLuggage,
      'reservationStatus': reservationStatus,
      'userId': userId,
      'rideId': rideId
    };
  }
}
