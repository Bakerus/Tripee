class ResponsePublicationTrajetModel {
  int id;
  String departureDate;
  String departureTime;
  PlaceModel departurePlace;
  PlaceModel arrivalPlace;
  VehicleModel vehicle;
  double price;
  int availablePlaces;
  bool doExpedition;
  double maxWeight;
  String status;
  UserResponse user;

  ResponsePublicationTrajetModel({
    required this.id,
    required this.departureDate,
    required this.departureTime,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.vehicle,
    required this.price,
    required this.availablePlaces,
    required this.doExpedition,
    required this.maxWeight,
    required this.status,
    required this.user,
  });

  factory ResponsePublicationTrajetModel.fromJson(Map<String, dynamic> json) =>
      ResponsePublicationTrajetModel(
        id: json["id"],
        departureDate: json["departureDate"],
        departureTime: json["departureTime"],
        departurePlace: PlaceModel.fromJson(json["departurePlace"]),
        arrivalPlace: PlaceModel.fromJson(json["arrivalPlace"]),
        vehicle: VehicleModel.fromJson(json["vehicle"]),
        price: json["price"].toDouble(),
        availablePlaces: json["availablePlaces"],
        doExpedition: json["doExpedition"],
        maxWeight: json["maxWeight"].toDouble(),
        status: json["status"],
        user: UserResponse.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "departureDate": departureDate,
        "departureTime": departureTime,
        "departurePlace": departurePlace,
        "arrivalPlace": arrivalPlace,
        "vehicle": vehicle.toJson(),
        "price": price,
        "availablePlaces": availablePlaces,
        "doExpedition": doExpedition,
        "maxWeight": maxWeight,
        "status": doExpedition,
        "user": user,
      };
}

class PlaceModel {
  int id = 0;
  String name = "";
  String town = "";
  String latitude = "";
  String longitude = "";
  String details = "";

  PlaceModel({
    required this.id,
    required this.name,
    required this.town,
    required this.longitude,
    required this.latitude,
    required this.details,
  });

  PlaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    town = json["town"];
    longitude = json['longitude'];
    latitude = json['latitude'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'town': town,
        'longitude': longitude,
        'latitude': latitude,
        'details': details,
      };
}

class VehicleModel {
  int id;
  String vehicleBrand;
  String registrationNumber;
  String imagePath;

  VehicleModel({
    required this.id,
    required this.vehicleBrand,
    required this.registrationNumber,
    required this.imagePath,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
      id : json['id'],
      vehicleBrand: json["vehicleBrand"],
      registrationNumber: json["registrationNumber"],
      imagePath: json['imagePath']);

  Map<String, dynamic> toJson() => {
        "vehicleBrand": vehicleBrand,
        "registrationNumber": registrationNumber,
        "imagePath": imagePath,
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
