import 'package:get/get.dart';
import 'package:tripee/app/data/models/onboard_model.dart';

class OnboardinScreenController extends GetxController {
  final List<OnboardModel> onboardData = [
    OnboardModel(
        image: "assets/images/onboarding_1.png",
        title: "Bienvenue sur Tripee",
        description: "Trouvez un compagnon Tripee près de vous !",
        arguments:
            "Préparez-vous à vivre une expérience de voyage fluide et pratique. Tripee est là pour vous permettre d’aller partout où vous devez aller au Canada, sans tracas. Commençons !"),
    OnboardModel(
        image: "assets/images/onboarding_2.png",
        title: "Expédiez vos colis en toute sécurité",
        description: "Le transport de vos colis à porté de main !",
        arguments:
            "Trouvez des Tripers pouvant vous aider à voyager ou expédier vos colis vers la destination de votre choix et en toute sécurité. Réservez un Tripee depuis votre position et le tour est joué!"),
    OnboardModel(
        image: "assets/images/onboarding_3.png",
        title: "Paiements rapides et sécurisés",
        description: "Des paiements en ligne sans tracas !",
        arguments:
            "Laissez votre portefeuille derrière vous, vos paiements sont sécurisés et sans tracas. Configurez votre méthode de paiement préférée et découvrez la facilité des transactions sans argent liquide."),
  ];

  final currentpage = 0.obs;
  final isForward = true.obs;
  final navigateState = false.obs;

  void goNextpage() {
    if (currentpage.value < onboardData.length - 1) {
      isForward.value = true;
      currentpage.value++;
    }
  }

  void goPreviousPage() {
    if (currentpage.value > 0) {
      isForward.value = false;
      currentpage.value--;
    }
  }
}
