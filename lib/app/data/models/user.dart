class User {
  int? userId;
  String? userName;
  String? email;
  String? password;
  String? phoneNumber;
  String? token;

  User(
      {this.userId,
      this.userName,
      this.email,
      this.password,
      this.phoneNumber,
      this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'],
      userName:
          json['username'] ?? '' ?? '', // Default to an empty string if null
      email: json['email'] ?? '' ?? '', // Default to an empty string if null
      password:
          json['password'] ?? '' ?? '', // Default to an empty string if null
      phoneNumber:
          json['phoneNumber'] ?? '' ?? '', // Default to an empty string if null
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'token': token,
      };
}

// *****************************************************************************
// User Model
// 
// This class defines a `User` object, which holds user-related information 
// such as username, email, password, phone number, and token. The class 
// supports both serialization and deserialization, making it compatible with 
// JSON data formats.
// 
// Key features:
// - `User` class constructor allows initializing instances of the class with 
//   optional parameters.
// - `fromJson` factory constructor to create a `User` instance from a JSON 
//   map, with default values to handle null values in the response.
// - `toJson` method to convert a `User` instance into a JSON map, allowing the 
//   user object to be easily serialized.
// 
// Attributes:
// - `userName`: String? - The user's display name.
// - `email`: String? - The user's email address.
// - `password`: String? - The user's password (optional, for registration or login).
// - `phoneNumber`: String? - The user's phone number.
// - `token`: String? - The authentication token for the user.
// 
// *****************************************************************************
