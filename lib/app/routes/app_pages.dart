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
import '../modules/discover/bindings/discover_binding.dart';
import '../modules/discover/views/discover_view.dart';
import '../modules/editProfile/bindings/edit_profile_binding.dart';
import '../modules/editProfile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/map/bindings/map_binding.dart';
import '../modules/map/views/map_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/social/bindings/social_binding.dart';
import '../modules/social/views/social_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/updateGender/bindings/update_gender_binding.dart';
import '../modules/updateGender/views/update_gender_view.dart';
import '../modules/updateHabits/bindings/update_habits_binding.dart';
import '../modules/updateHabits/views/update_habits_view.dart';
import '../modules/updateLanguage/bindings/update_language_binding.dart';
import '../modules/updateLanguage/views/update_language_view.dart';
import '../modules/updatePersonality/bindings/update_personality_binding.dart';
import '../modules/updatePersonality/views/update_personality_view.dart';
import '../modules/updateRelation/bindings/update_relation_binding.dart';
import '../modules/updateRelation/views/update_relation_view.dart';
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
    GetPage(name: Routes.map, page: () => MapView(), binding: MapBinding()),
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
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: Routes.discover,
      page: () => const DiscoverView(),
      binding: DiscoverBinding(),
    ),
    GetPage(
      name: Routes.updateGender,
      page: () => const UpdateGenderView(),
      binding: UpdateGenderBinding(),
    ),
    GetPage(
      name: Routes.updateHabits,
      page: () => const UpdateHabitsView(),
      binding: UpdateHabitsBinding(),
    ),
    GetPage(
      name: Routes.updateRelation,
      page: () => const UpdateRelationView(),
      binding: UpdateRelationBinding(),
    ),
    GetPage(
      name: Routes.updatePersonality,
      page: () => const UpdatePersonalityView(),
      binding: UpdatePersonalityBinding(),
    ),
    GetPage(
      name: Routes.updateLanguage,
      page: () => const UpdateLanguageView(),
      binding: UpdateLanguageBinding(),
    ),
  ];
}
