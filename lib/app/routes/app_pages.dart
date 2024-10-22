import 'package:get/get.dart';

import '../modules/check_order/bindings/check_order_binding.dart';
import '../modules/check_order/views/check_order_view.dart';
import '../modules/confirm_order/bindings/confirm_order_binding.dart';
import '../modules/confirm_order/views/confirm_order_view.dart';
import '../modules/dasboard/bindings/dashboard_binding.dart';
import '../modules/dasboard/views/dashboard_view.dart';
import '../modules/discussion_message/bindings/discussion_message_binding.dart';
import '../modules/discussion_message/views/discussion_message_view.dart';
import '../modules/edit_expedition/bindings/edit_expedition_binding.dart';
import '../modules/edit_expedition/views/edit_expedition_view.dart';
import '../modules/editer_publication/bindings/editer_publication_binding.dart';
import '../modules/editer_publication/views/editer_publication_view.dart';
import '../modules/expedition/bindings/expedition_binding.dart';
import '../modules/expedition/views/expedition_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/location_on_map/bindings/location_on_map_binding.dart';
import '../modules/location_on_map/views/location_on_map_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/modified_publication/bindings/modified_publication_binding.dart';
import '../modules/modified_publication/views/modified_publication_view.dart';
import '../modules/onboardin_screen/bindings/onboardin_screen_binding.dart';
import '../modules/onboardin_screen/views/onboardin_screen_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';
import '../modules/otp_verification/bindings/otp_verification_binding.dart';
import '../modules/otp_verification/views/otp_verification_view.dart';
import '../modules/post_activity/bindings/post_activity_binding.dart';
import '../modules/post_activity/views/post_activity_view.dart';
import '../modules/post_expedition/bindings/post_expedition_binding.dart';
import '../modules/post_expedition/views/post_expedition_view.dart';
import '../modules/post_order/bindings/post_order_binding.dart';
import '../modules/post_order/views/post_order_view.dart';
import '../modules/post_publication/bindings/post_publication_binding.dart';
import '../modules/post_publication/views/post_publication_view.dart';
import '../modules/publication/bindings/publication_binding.dart';
import '../modules/publication/views/publication_view.dart';
import '../modules/recipe_message/bindings/recipe_message_binding.dart';
import '../modules/recipe_message/views/recipe_message_view.dart';
import '../modules/recipe_payment/bindings/recipe_payment_binding.dart';
import '../modules/recipe_payment/views/recipe_payment_view.dart';
import '../modules/search_result/bindings/search_result_binding.dart';
import '../modules/search_result/views/search_result_view.dart';
import '../modules/searching/bindings/searching_binding.dart';
import '../modules/searching/views/searching_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/user_account/bindings/user_account_binding.dart';
import '../modules/user_account/views/user_account_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.onboardinScreen,
      page: () => const OnboardinScreenView(),
      binding: OnboardinScreenBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.otpVerification,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.publication,
      page: () => const PublicationView(),
      binding: PublicationBinding(),
    ),
    GetPage(
      name: _Paths.editerPublication,
      page: () => const EditerPublicationView(),
      binding: EditerPublicationBinding(),
    ),
    GetPage(
      name: _Paths.expedition,
      page: () => const ExpeditionView(),
      binding: ExpeditionBinding(),
    ),
    GetPage(
      name: _Paths.searchResult,
      page: () => const SearchResultView(),
      binding: SearchResultBinding(),
    ),
    GetPage(
      name: _Paths.searching,
      page: () => const SearchingView(),
      binding: SearchingBinding(),
    ),
    GetPage(
      name: _Paths.editExpedition,
      page: () => const EditExpeditionView(),
      binding: EditExpeditionBinding(),
    ),
    GetPage(
      name: _Paths.order,
      page: () => const OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.confirmOrder,
      page: () => const ConfirmOrderView(),
      binding: ConfirmOrderBinding(),
    ),
    GetPage(
      name: _Paths.postPublication,
      page: () => const PostPublicationView(),
      binding: PostPublicationBinding(),
    ),
    GetPage(
      name: _Paths.postActivity,
      page: () => const PostActivityView(),
      binding: PostActivityBinding(),
    ),
    GetPage(
      name: _Paths.locationOnMap,
      page: () => const LocationOnMapView(),
      binding: LocationOnMapBinding(),
    ),
    GetPage(
      name: _Paths.checkOrder,
      page: () => const CheckOrderView(),
      binding: CheckOrderBinding(),
    ),
    GetPage(
      name: _Paths.modifiedPublication,
      page: () => const ModifiedPublicationView(),
      binding: ModifiedPublicationBinding(),
    ),
    GetPage(
      name: _Paths.postOrder,
      page: () => const PostOrderView(),
      binding: PostOrderBinding(),
    ),
    GetPage(
      name: _Paths.postExpedition,
      page: () => const PostExpeditionView(),
      binding: PostExpeditionBinding(),
    ),
    GetPage(
      name: _Paths.recipeMessage,
      page: () => const RecipeMessageView(),
      binding: RecipeMessageBinding(),
    ),
    GetPage(
      name: _Paths.discussionMessage,
      page: () => const DiscussionMessageView(),
      binding: DiscussionMessageBinding(),
    ),
    GetPage(
      name: _Paths.recipePayment,
      page: () => RecipePaymentView(),
      binding: RecipePaymentBinding(),
    ),
    GetPage(
      name: _Paths.USER_ACCOUNT,
      page: () => UserAccountView(),
      binding: UserAccountBinding(),
    ),
  ];
}
