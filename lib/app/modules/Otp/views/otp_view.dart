import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../../../routes/app_pages.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 21),
                      child: Text('Verify your number', style: SemiPopinsBlack),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 21),
                      child: Obx(
                        () => Text(
                          "Enter the code we’ve sent by text to\n${controller.mobileNumber.value}",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 21),
                      child: Text("Verify Otp", style: TextRegulaPopBlack),
                    ),
                    SizedBox(height: 10),
                    Form(
                      key: controller.formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(6, (index) {
                          return SizedBox(
                            width: 50,
                            height: 50,
                            child: TextFormField(
                              controller: controller.otpControllers[index],
                              focusNode: controller.focusNodes[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(fontSize: 20),
                              maxLength: 1,
                              decoration: InputDecoration(
                                counterText: "",
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                errorStyle: TextStyle(height: 0),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) return null;
                                if (value.length != 1) return "";
                                return null;
                              },
                              onChanged: (value) {
                                if (value.length == 1 && index < 5) {
                                  FocusScope.of(context).requestFocus(
                                    controller.focusNodes[index + 1],
                                  );
                                }
                                if (value.isEmpty && index > 0) {
                                  FocusScope.of(context).requestFocus(
                                    controller.focusNodes[index - 1],
                                  );
                                }
                              },
                            ),
                          );
                        }),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Edit Phone Number?",
                            style: PopinsBold.copyWith(
                              decorationColor: Color(0xff525252),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Send again", style: PopiBoldBlue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      "This code should arrive within ${controller.seconds.value}s",
                      style: poppinsReq,
                    ),
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0XFF101010),
                    child: IconButton(
                      onPressed: () {
                        bool isOtpComplete = controller.otpControllers.every(
                          (c) => c.text.isNotEmpty && c.text.length == 1,
                        );

                        if (isOtpComplete) {
                          controller.submitOtp(); // OTP submit
                          Get.offNamed(Routes.intro); // Navigate
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please enter the complete OTP",
                          );
                        }
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0XFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Obx(() => IconButton(
// onPressed: controller.getOtp().length == 6 ? controller.submitOtp : null,
// icon: Icon(Icons.arrow_forward_ios),
// )
