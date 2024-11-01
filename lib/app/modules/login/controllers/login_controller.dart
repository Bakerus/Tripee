import 'dart:convert';

import 'package:get/get.dart';
import 'package:tripee/app/data/models/error_model.dart';
import 'package:tripee/app/data/models/user.dart';
import 'package:tripee/app/data/providers/user_provider.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class LoginController extends GetxController {
  UserProvider userProvider = UserProvider();
  User user = User();

  ErrorModel? errorModel;
  final isvalidated = false.obs;
  final isregister = false.obs;
  final isloading = false.obs;
  var email = ''.obs;
  var password = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  final errorMessageForLogin = ''.obs;

  void validateEmails() {
    if (email.isEmpty) {
      emailError.value = "L'email ne doit pas être vide";
      isvalidated.value = false;
    } else if (!GetUtils.isEmail(email.value)) {
      emailError.value = "Format d'email incorrect";
      isvalidated.value = false;
    } else {
      emailError.value = '';
      isvalidated.value = true;
    }
  }

  void validatePassword() {
    if (password.isEmpty) {
      passwordError.value = "Le mot de passe ne doit pas être vide";
      isvalidated.value = false;
    } else if (password.value.length < 8) {
      passwordError.value =
          "Le mot de passe doit contenir au moins 8 caractères";
      isvalidated.value = false;
    } else {
      passwordError.value = '';
      isvalidated.value = true;
    }
  }

  getUserInformations() {
    user.email = email.value;
    user.password = password.value;
  }

  loginUser(User user) async {
    var response = await userProvider.postUserforLogin(user);
    if (response is User) {
      User userLogin = response;
      isregister.value = true;
      storeUserInformations(userLogin);
      isloading.value = true;
    } else if (response is ErrorModel) {
      ErrorModel errorModel = response;
      errorMessageForLogin.value = errorModel.message.toString();
      isregister.value = false;
    }
  }

  storeUserInformations(User userLogin) async {
    Map<String, dynamic> userInfo = {
      "token": userLogin.token.toString(),
      "userId": userLogin.userId.toString(),
      "username": userLogin.userName.toString(),
    };
    String jsonString = jsonEncode(userInfo);
    await LocalFileServices().writeToFile(jsonString);
  }
}

/**
 * This file defines the `LoginController` class, which handles the login process in the application.
 * 
 * Main functionalities include:
 * 1. **Validations[validatePassword(), validateEmails()]**: It validates the user's email and password inputs before attempting login.
 * 2. **Login Process (loginUser(User user))**: The controller manages the login operation, checking if the provided credentials are correct.
 * 3. **Local Storage (storeUserInformations())**: If login is successful, it stores user information locally for session management.
 * 
 * Key variables:
 * - `email`, `password`: Reactive variables for storing user inputs.
 * - `emailError`, `passwordError`: Reactive variables that store error messages for email and password validation.
 * - `isvalidated`, `isregister`, `isloading`: Reactive booleans that indicate validation status, registration success, and loading state.
 * - `errorMessageForLogin`: A reactive variable for displaying error messages from the login attempt.
 * - `userProvider`: An instance of `UserProvider` that handles API calls.
 * - `userLogin`: Stores the authenticated user information upon successful login.
 * - `errorModel`: Stores the error information if login fails.
 * 
 * The class extends `GetxController` to leverage GetX's reactivity, allowing seamless UI updates based on state changes.
 */
