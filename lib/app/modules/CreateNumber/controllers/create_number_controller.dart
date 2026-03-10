import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../../../routes/app_pages.dart';
import 'package:country_picker/country_picker.dart';

class CreateNumberController extends GetxController {
  // Country code aur mobile number controllers
  final countryCodeController = TextEditingController();
  final numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxString countryCode = "+91".obs;
  RxString countryFlag = "🇮🇳".obs;
  var isChecked = false.obs;

  bool get isCountrySelected => countryCode.isNotEmpty;

  @override
  void onClose() {
    // Dispose all controllers
    countryCodeController.dispose();
    numberController.dispose();
    super.onClose();
  }

  void selectCountry(String code, String flag) {
    countryCode.value = "+$code";
    countryFlag.value = flag;
    countryCodeController.text = "+$code";
  }

  void openCountryPicker() {
    showCountryPicker(
      context: Get.context!,
      showPhoneCode: true,
      onSelect: (Country country) {
        selectCountry(country.phoneCode, country.flagEmoji);
      },
    );
  }

  void showSimplePopup() {
    if (formKey.currentState!.validate()) {
      Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: 323,
            height: 250,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "We need to verify Your number",
                  style: SemiPopinsBlack,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "We need to make sure that ${countryCode.value} ${numberController.text} is your number.",
                  style: MediuPopi,
                  textAlign: TextAlign.center,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancel", style: PopiBlue),
                    ),

                    TextButton(
                      onPressed: () {
                        Get.offNamed(Routes.otp);
                      },
                      child: Text("OK", style: PopiRegBlue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  void validateForm() {
    if (formKey.currentState!.validate()) {
      Get.defaultDialog(
        title: "Verify your number",
        middleText:
            "We need to make sure that ${countryCode.value} ${numberController.text} is your number.",
        textConfirm: "OK",
        textCancel: "Cancel",
      );
    }
  }
}
