import 'package:get/get.dart';

import '../controllers/allow_controller.dart';

class AllowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllowController>(() => AllowController());
  }
}
