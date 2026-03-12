import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../editProfile/controllers/edit_profile_controller.dart';

class UpdateHabitsController extends GetxController {
  EditProfileController? editController;

  RxString selectedDrink = "".obs;
  RxString selectedSmoke = "".obs;

  List<String> drinkOptions = [
    "Regularly",
    "Occasionally",
    "Trying to quit",
    "Rarely",
  ];

  List<String> smokeOptions = ["Smoker", "Non-smoker", "Trying to quit"];

  @override
  void onInit() {
    super.onInit();

    // ✅ INITIALIZE HERE with safety check
    _initEditController();

    selectedDrink.value = editController!.drink.value;
    selectedSmoke.value = editController!.smoke.value;
  }

  void _initEditController() {
    if (Get.isRegistered<EditProfileController>()) {
      editController = Get.find<EditProfileController>();
    } else {
      editController = Get.put(EditProfileController(), permanent: true);
    }
  }

  void updateHabits() {
    print("Drink: ${selectedDrink.value}");
    print("Smoke: ${selectedSmoke.value}");
    print("Update button clicked 🚀");

    editController!.drink.value = selectedDrink.value;
    editController!.smoke.value = selectedSmoke.value;

    Get.toNamed(Routes.editProfile);

    print("✅ SCREEN CLOSED!");
  }
}
