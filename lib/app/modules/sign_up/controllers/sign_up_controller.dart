import 'package:get/get.dart';
import 'package:tripee/app/data/models/user.dart';
import 'package:tripee/app/data/providers/user_provider.dart';

class SignUpController extends GetxController {
  final isvalidated = false.obs;
  UserProvider userProvider = UserProvider();
  User user = User();
  final RegExp canadianPhoneNumberRegex =
      RegExp(r'^(?:\+237|237)?\s?[2368]\d{8}$');
  var userName = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var phoneNumber = ''.obs;
  var phoneNumberError = ''.obs;

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

  void validatephoneNumber() {
    if (phoneNumber.isEmpty) {
      phoneNumberError.value = "Le numero de telephone ne doit pas etre vide";
      isvalidated.value = false;
    } else if (!canadianPhoneNumberRegex.hasMatch(phoneNumber.value)) {
      phoneNumberError.value = "Le numero de telephone est invalide";
      isvalidated.value = false;
    } else {
      phoneNumberError.value = "";
      isvalidated.value = true;
    }
  }

  getUserInformations() {
    user.userName = userName.value;
    user.email = email.value;
    user.password = password.value;
    user.phoneNumber = "+237$phoneNumber";
  }

  sendOtp(String phoneNumber) {
    userProvider.postOtp("+237$phoneNumber");
  }
}

/**
 * This file defines the `SignUpController` class, which manages the logic behind the sign-up process in the application.
 * 
 * Main functionalities include:
 * 1. **Field Validation**: The controller validates user inputs such as email, password, and phone number, and provides error messages when validation fails.
 * 2. **User Information**: It collects the necessary user data (username, email, password, phone number) to be passed during the sign-up process.
 * 3. **OTP Sending**: The controller handles sending an OTP (One-Time Password) to the user's phone number for verification.
 * 
 * Key variables:
 * - `userName`, `email`, `password`, `phoneNumber`: Reactive variables to hold the user inputs.
 * - `emailError`, `passwordError`, `phoneNumberError`: Reactive variables that store error messages related to input validation.
 * - `isvalidated`: A reactive boolean that indicates whether all inputs are valid.
 * - `canadianPhoneNumberRegex`: A regular expression pattern for validating phone numbers in the +237 (Cameroon) format.
 * - `user`: A `User` model to store the user's information for sign-up purposes.
 * - `userProvider`: An instance of `UserProvider` used to send requests such as OTP verification.
 * 
 * The class extends `GetxController` to manage state reactively using GetX's observable system (`.obs`).
 */