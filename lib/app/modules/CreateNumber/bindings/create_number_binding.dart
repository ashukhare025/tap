import 'package:get/get.dart';

import '../controllers/create_number_controller.dart';

class CreateNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNumberController>(
      () => CreateNumberController(),
    );
  }
}
