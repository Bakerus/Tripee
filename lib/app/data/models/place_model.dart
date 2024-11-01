class PlaceModel {
  String cityName = "";
  String latitude = "";
  String longitude = "";
  String detail = "";
  String town = "";

  PlaceModel(
      {required this.cityName,
      required this.latitude,
      required this.longitude,
      required this.detail,
      required this.town});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    latitude = json['lat'];
    longitude = json['lon'];
    detail = json['display_name'];
    town = json["address"]['city'].toString();
  }

  Map<String, dynamic> toJson() => {
        'name': cityName,
        'latitude': latitude,
        'longitude': longitude,
        'details': detail,
        'town': town,
      };
}

/**
 * This file defines the `PlaceModel` class, which represents a geographical place with various attributes 
 * retrieved from the OpenStreetMap API.
 *
 * Main functionalities include:
 *
 * 1. **Data Representation (PlaceModel class)**: Stores key place information including `cityName`, `latitude`, 
 *    `longitude`, `detail`, and `town`. Each attribute is a string to accommodate various formats and sources.
 * 
 * 2. **JSON Parsing (PlaceModel.fromJson)**: Constructor that initializes the `PlaceModel` instance by mapping 
 *    JSON fields to class attributes. Parses fields such as 'name', 'lat', 'lon', 'display_name', and city from 
 *    a nested JSON object, making the class suitable for API data handling.
 * 
 * 3. **JSON Serialization (toJson())**: Converts a `PlaceModel` instance back into JSON format, with keys like 
 *    'name', 'latitude', 'longitude', 'details', and 'town'. This allows seamless data exchange and storage.
 * 
 * Key variables and methods:
 * - `cityName`, `latitude`, `longitude`, `detail`, `town`: Attributes to hold place-related data, allowing 
 *   the class to represent various aspects of a place.
 * - `PlaceModel.fromJson`: Constructor for creating an instance from JSON data, parsing each key-value pair to 
 *   initialize the class attributes.
 * - `toJson`: Method to convert a `PlaceModel` instance into a JSON object, providing a standardized structure 
 *   for data storage and transfer.
 *
 * The class facilitates the modeling of geographic data by providing an easy-to-use structure for place-related information.
 */

