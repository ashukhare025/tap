import 'package:get/get.dart';

import '../modules/Allow/bindings/allow_binding.dart';
import '../modules/Allow/views/allow_view.dart';
import '../modules/Checkin/bindings/checkin_binding.dart';
import '../modules/Checkin/views/checkin_view.dart';
import '../modules/CreateNumber/bindings/create_number_binding.dart';
import '../modules/CreateNumber/views/create_number_view.dart';
import '../modules/HomeState/bindings/home_state_binding.dart';
import '../modules/HomeState/views/home_state_view.dart';
import '../modules/IntroDetails/bindings/intro_details_binding.dart';
import '../modules/IntroDetails/views/intro_details_view.dart';
import '../modules/Onboarding/bindings/onboarding_binding.dart';
import '../modules/Onboarding/views/onboarding_view.dart';
import '../modules/Otp/bindings/otp_binding.dart';
import '../modules/Otp/views/otp_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/map/bindings/map_binding.dart';
import '../modules/map/views/map_view.dart';
import '../modules/social/bindings/social_binding.dart';
import '../modules/social/views/social_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/vibes/bindings/vibes_binding.dart';
import '../modules/vibes/views/vibes_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.onboarding;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(name: Routes.otp, page: () => OtpView(), binding: OtpBinding()),
    GetPage(
      name: Routes.number,
      page: () => CreateNumberView(),
      binding: CreateNumberBinding(),
    ),
    GetPage(
      name: Routes.intro,
      page: () => IntroDetailsView(),
      binding: IntroDetailsBinding(),
    ),
    GetPage(
      name: Routes.allow,
      page: () => AllowView(),
      binding: AllowBinding(),
    ),
    GetPage(name: Routes.home, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: Routes.chat,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.vibes,
      page: () => const VibesView(),
      binding: VibesBinding(),
    ),
    GetPage(
      name: Routes.map,
      page: () => const MapView(),
      binding: MapBinding(),
    ),
    GetPage(
      name: Routes.social,
      page: () => const SocialView(),
      binding: SocialBinding(),
    ),
    GetPage(
      name: Routes.homeState,
      page: () => const HomeStateView(),
      binding: HomeStateBinding(),
    ),
    GetPage(
      name: Routes.checkin,
      page: () => const CheckinView(),
      binding: CheckinBinding(),
    ),
  ];
}
