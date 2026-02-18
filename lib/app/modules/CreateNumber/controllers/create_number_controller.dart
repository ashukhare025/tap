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
      Get.defaultDialog(
        title: "We need to verify your number",
        titleStyle: SemiPopinsBlack,
        middleText:
            "We need to make sure that ${countryCode.value} ${numberController.text} is your number.",
        middleTextStyle: PopiReq,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel", style: PopiMedBlue),
              ),
              TextButton(
                onPressed: () {
                  Get.offNamed(Routes.otp);
                },
                child: Text("OK", style: PopiMedBlue),
              ),
            ],
          ),
        ],
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
