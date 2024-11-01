import 'package:tripee/app/data/models/place_model.dart';

class PublicationTrajetModel {
  String departureDate;
  String departureTime;
  PlaceModel departurePlace;
  PlaceModel arrivalPlace;
  VehicleModel vehicle;
  double price;
  int availablePlaces;
  double maxWeight;
  bool doExpedition;
  int userId;

  PublicationTrajetModel({
    required this.departureDate,
    required this.departureTime,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.vehicle,
    required this.price,
    required this.availablePlaces,
    required this.maxWeight,
    required this.doExpedition,
    required this.userId,
  });

  factory PublicationTrajetModel.fromJson(Map<String, dynamic> json) =>
      PublicationTrajetModel(
        departureDate: json["departureDate"],
        departureTime: json["departureTime"],
        departurePlace: PlaceModel.fromJson(json["departurePlace"]),
        arrivalPlace: PlaceModel.fromJson(json["arrivalPlace"]),
        vehicle: VehicleModel.fromJson(json["vehicle"]),
        price: json["price"].toDouble(),
        availablePlaces: json["availablePlaces"],
        maxWeight: json["maxWeight"].toDouble(),
        doExpedition: json["doExpedition"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "departureDate": departureDate,
        "departureTime": departureTime,
        "departurePlace": departurePlace,
        "arrivalPlace": arrivalPlace,
        "vehicle": vehicle.toJson(),
        "price": price,
        "availablePlaces": availablePlaces,
        "maxWeight": maxWeight,
        "doExpedition": doExpedition,
        "userId": userId,
      };
}

class VehicleModel {
  String vehicleBrand;
  String registrationNumber;

  VehicleModel({
    required this.vehicleBrand,
    required this.registrationNumber,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        vehicleBrand: json["vehicleBrand"],
        registrationNumber: json["registrationNumber"],
      );

  Map<String, dynamic> toJson() => {
        "vehicleBrand": vehicleBrand,
        "registrationNumber": registrationNumber,
      };
}
