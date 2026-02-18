import 'package:get/get.dart';

import '../controllers/vibes_controller.dart';

class VibesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VibesController>(
      () => VibesController(),
    );
  }
}
