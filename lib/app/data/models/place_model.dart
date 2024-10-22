class PlaceModel {
  String cityName = "";
  String latitude = "";
  String longitude = "";

  PlaceModel(
      {required this.cityName,
      required this.latitude,
      required this.longitude});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    latitude = json['lat'];
    longitude = json['lon'];
  }
}
