class ErrorModel {
  String? detail;
  String? message;
  String? timetamps;

  ErrorModel({this.detail, this.message, this.timetamps});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      detail: json['detail'] ?? '', // Default to an empty string if null
      message: json['message'] ?? '', // Default to an empty string if null
      timetamps: json['timetamps'] ?? '', // Default to an empty string if null
    );
  }
}



// *****************************************************************************
// ErrorModel
// 
// This class defines an `ErrorModel` object, which represents error information
// that may be received from an API or other data sources. The class supports 
// deserialization from JSON data.
// 
// Key features:
// - `ErrorModel` class constructor allows initializing instances of the class 
//   with optional parameters.
// - `fromJson` factory constructor to create an `ErrorModel` instance from a 
//   JSON map, with default values to handle null or missing fields.
// 
// Attributes:
// - `detail`: String? - A string providing more detailed information about the error.
// - `message`: String? - A brief message describing the error.
// - `timetamps`: String? - The timestamp indicating when the error occurred.
// 
// *****************************************************************************
