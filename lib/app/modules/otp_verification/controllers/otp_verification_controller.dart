import 'dart:convert';

import 'package:get/get.dart';
import 'package:tripee/app/data/models/error_model.dart';
import 'package:tripee/app/data/models/user.dart';
import 'package:tripee/app/data/providers/user_provider.dart';
import 'package:tripee/app/data/services/local_file_services.dart';

class OtpVerificationController extends GetxController {
  UserProvider userProvider = UserProvider();
  final otpState = false.obs;
  final accounCanCreated = false.obs;
  String otpValue = "";
  final errorMessageForSignUp = ''.obs;

  void updateOtpState() => otpState.value = true;

  sendUserInformations(User user, String otp) async {
    var response = await userProvider.postUserforSignUp(user, otp);
    if (response is User) {
      User userRegister = response;
      storeUserInformations(userRegister);
      accounCanCreated.value = true;
    } else if (response is ErrorModel) {
      errorMessageForSignUp.value = response.message.toString();
      accounCanCreated.value = false;
    }
  }

  storeUserInformations(User userRegister) async {
    Map<String, dynamic> userInfo = {
      "token": userRegister.token.toString(),
      "userId": userRegister.userId.toString(),
      "username": userRegister.userName.toString(),
    };
    String jsonString = jsonEncode(userInfo);
    await LocalFileServices().writeToFile(jsonString);
  }
}


/**
 * This file defines the `OtpVerificationController` class, which handles OTP verification and registration processes.
 * 
 * Main functionalities include:
 * 1. **OTP State Management (updateOtpState())**: Updates the state of OTP validation to notify the UI(button send) when OTP is verified.
 * 2. **User Registration (sendUserInformations(User user, String otp))**: Sends the user data and OTP to the server and handles the response:
 *    - If successful, it updates local state to allow account creation.
 *    - If unsuccessful, it stores an error message for UI display.
 * 3. **Local Storage (storeUserInformations(User userRegister))**: Stores the registered user’s information in a local file for session persistence.
 * 
 * Key variables:
 * - `otpState`: A reactive boolean indicating the OTP verification state.
 * - `accounCanCreated`: A reactive boolean indicating whether the account creation process is allowed.
 * - `otpValue`: A string storing the OTP value entered by the user.
 * - `errorMessageForSignUp`: A reactive string storing error messages related to sign-up issues.
 * - `userProvider`: An instance of `UserProvider`, used for making API calls related to user registration.
 * 
 * The class extends `GetxController` to leverage GetX's reactive state management, enabling responsive updates within the UI as the registration and OTP validation states change.
 */