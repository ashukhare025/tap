import 'package:get/get.dart';

import '../controllers/update_habits_controller.dart';

class UpdateHabitsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateHabitsController>(
      () => UpdateHabitsController(),
    );
  }
}
