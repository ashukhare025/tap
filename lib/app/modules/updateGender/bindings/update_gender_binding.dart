import 'package:get/get.dart';

import '../controllers/update_gender_controller.dart';

class UpdateGenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateGenderController>(
      () => UpdateGenderController(),
    );
  }
}
