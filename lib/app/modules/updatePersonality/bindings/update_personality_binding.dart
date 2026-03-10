import 'package:get/get.dart';

import '../controllers/update_personality_controller.dart';

class UpdatePersonalityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePersonalityController>(
      () => UpdatePersonalityController(),
    );
  }
}
