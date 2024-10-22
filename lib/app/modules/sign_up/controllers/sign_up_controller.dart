import 'package:get/get.dart';

class SignUpController extends GetxController {
  final isvalidated = false.obs;
  final RegExp canadianPhoneNumberRegex =
      RegExp(r'^\(?([2-9]{1}[0-9]{2})\)?[-.● ]?([0-9]{3})[-.● ]?([0-9]{4})$');
  var userName = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var phoneNumber = ''.obs;
  var phoneNumberError = ''.obs;

  // Fonction de validation de l'email
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

// Fonction de validation du mot de passe
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
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
