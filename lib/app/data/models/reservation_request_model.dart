class ReservationRequestModel {
  final int? reservedPlaces;
  double? price;
  final bool? hasLuggage;
  final int? userId;
  int? rideId;

  ReservationRequestModel(
      {this.reservedPlaces,
      this.price,
      this.hasLuggage,
      this.userId,
      this.rideId});

  factory ReservationRequestModel.fromJson(Map<String, dynamic> json) {
    return ReservationRequestModel(
        reservedPlaces: json['reservedPlaces'],
        price: json['price'],
        hasLuggage: json['hasLuggage'],
        userId: json['userId'],
        rideId: json['rideId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'reservedPlaces': reservedPlaces,
      'price': price,
      'hasLuggage': hasLuggage,
      'userId': userId,
      'rideId': rideId
    };
  }
}
