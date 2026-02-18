import 'package:get/get.dart';

import '../controllers/intro_details_controller.dart';

class IntroDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroDetailsController>(
      () => IntroDetailsController(),
    );
  }
}
