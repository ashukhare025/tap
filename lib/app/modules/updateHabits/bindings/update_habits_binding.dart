import 'package:get/get.dart';

import '../../editProfile/controllers/edit_profile_controller.dart';
import '../controllers/update_habits_controller.dart';

class UpdateHabitsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UpdateHabitsController());
    Get.put(EditProfileController(), permanent: true);
  }
}
