import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tripee/app/core/constants/identifiants_connections_to_backend.dart';
import 'package:tripee/app/data/models/error_model.dart';
import 'package:tripee/app/data/models/user.dart';

class UserProvider {
  final host = IdentifiantsConnectionsToBackend.host;
  final port = IdentifiantsConnectionsToBackend.port;
  static String path = "users/auth";

  Future<void> postOtp(String phoneNumber, {String action = "sendOtp"}) async {
    var url = Uri(
        scheme: "http",
        host: host,
        port: port,
        path: "$path/$action/$phoneNumber");
    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {}
    } catch (e) {
      throw "Exception :$e";
    }
  }

  Future<dynamic> postUserforSignUp(User user, String oTp,
      {String action = "register"}) async {
    var url =
        Uri(scheme: "http", host: host, port: port, path: "$path/$action/$oTp");
    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "username": user.userName,
            "email": user.email,
            "password": user.password,
            "phoneNumber": user.phoneNumber
          }));
      if (response.statusCode == 201) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        return ErrorModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw "Exception :$e";
    }
  }

  Future<dynamic> postUserforLogin(User user, {String action = "login"}) async {
    var url =
        Uri(scheme: "http", host: host, port: port, path: "$path/$action");
    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "email": user.email,
            "password": user.password,
          }));
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        return ErrorModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw "Exception :$e";
    }
  }
}

/**
 * This file defines the `UserProvider` class, which handles HTTP requests for user-related actions.
 * It uses the `http` package for sending requests to an API, and processes responses for different 
 * user actions such as OTP handling, user sign-up, and login. 
 * 
 * Main functionalities include:
 * 1. `postOtp` - Sends a request to send or verify an OTP based on the specified action.
 * 2. `postUserforSignUp` - Sends user data along with an OTP to register a new user.
 * 3. `postUserforLogin` - Sends login credentials (email and password) to authenticate a user.
 * 
 * The class also handles error responses and converts them into `ErrorModel` objects if the request fails.
 * 
 * Key details:
 * - API host is `IdentifiantsConnectionsToBackend.host` and the port used is ` IdentifiantsConnectionsToBackend.port`.
 * - The base path for user-related operations is `users/auth`.
 * - Each request is made using HTTP POST.
 * - User-related data (like email, password, etc.) is sent as JSON in the request body.
 * 
 * Nb: In my provider files, functions usually have a prefix indicating the nature of the operation performed (Example: if it's a post, we'll have post{action} ).
 */
