import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  var mobileNumber = "".obs;
  var seconds = 59.obs;
  final formKey = GlobalKey<FormState>();
  Timer? _timer;
  // 6 controllers
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  // 6 focus nodes (IMPORTANT)
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  void onOtpChange(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
        focusNodes[index + 1].requestFocus();
      } else if (getOtp().length == 6) {
        focusNodes[index].unfocus();
        submitOtp();
      }
    } else {
      if (index > 0) focusNodes[index - 1].requestFocus();
    }
  }

  String getOtp() {
    return otpControllers.map((e) => e.text).join();
  }

  void submitOtp() {
    final otp = getOtp();
    if (otp.length < 6) {
      Get.snackbar("Error", "Please enter complete OTP");
      return;
    }
    Get.snackbar("OTP", "Submitted OTP: $otp");
    // Navigate to home/next screen
  }

  void setMobileNumber(String number) {
    mobileNumber.value = number;
  }

  @override
  void onClose() {
    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    _timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    _timer?.cancel();
    seconds.value = 59;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    setMobileNumber("+91 9876543210");
    startTimer();
  }

  void resendOtp() {
    seconds.value = 59;
    startTimer();
    otpControllers.forEach((c) => c.clear());
    focusNodes[0].requestFocus();
    Get.snackbar("OTP", "OTP has been resent");
  }
}
