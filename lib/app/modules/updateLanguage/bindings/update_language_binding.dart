import 'package:get/get.dart';

import '../controllers/update_language_controller.dart';

class UpdateLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateLanguageController>(
      () => UpdateLanguageController(),
    );
  }
}
