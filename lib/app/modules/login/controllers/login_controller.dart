import 'package:get/get.dart';

class LoginController extends GetxController {
  final isvalidated = false.obs;
  var email = ''.obs;
  var password = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;

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
}
