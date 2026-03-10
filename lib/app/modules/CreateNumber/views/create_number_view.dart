import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../controllers/create_number_controller.dart';

class CreateNumberView extends GetView<CreateNumberController> {
  const CreateNumberView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 21),
                      child: Text(
                        textAlign: TextAlign.start,
                        'Can we get your number please?',
                        style: PopSemiBol,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 21),
                      child: Text(
                        textAlign: TextAlign.start,
                        "We only use phone numbers to make sure everyone on Tap is real.",
                        style: popLWC,
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 21),
                      child: Text(
                        textAlign: TextAlign.start,
                        "Mobile Number",
                        style: popBC,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 21, right: 21),
                      child: Form(
                        key: controller.formKey,
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .stretch, // ensures same height
                            children: [
                              // Country Code Field
                              SizedBox(
                                width: 101,
                                child: Obx(
                                  () => TextFormField(
                                    controller:
                                        controller.countryCodeController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      errorStyle: const TextStyle(height: 0),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 12,
                                      ),
                                      prefixIcon: GestureDetector(
                                        onTap: () {
                                          controller.openCountryPicker();
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(width: 8),
                                            Text(
                                              controller.countryFlag.value,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(width: 4),
                                            Text(controller.countryCode.value),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      hintText: "+91",
                                    ),
                                    validator: (value) {
                                      if (controller
                                          .countryCode
                                          .value
                                          .isEmpty) {
                                        return "";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),

                              SizedBox(width: 10),

                              // Mobile Number Field
                              Expanded(
                                child: TextFormField(
                                  controller: controller.numberController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    errorStyle: const TextStyle(height: 0),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 12,
                                    ),
                                    hintText: "9522148377",
                                    hintStyle: InterBC,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Color(0XFF8F8F8F),
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Color(0xffFF0000),
                                        width: 2,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "";
                                    }
                                    if (value.length != 10) return "";
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Obx(
                        () => Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Checkbox(
                                value: controller.isChecked.value,
                                visualDensity: VisualDensity.compact,
                                onChanged: (value) {
                                  controller.isChecked.value = value!;
                                },
                              ),
                              Text("I agree to the ", style: RegReg),
                              Text(
                                "Term & Conditions*",
                                style: PopMed.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, bottom: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "We never share this anyone and it won’t be \non your profile.",
                    style: poppinsLW,
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0XFFD9D9D9),
                    child: IconButton(
                      onPressed: () {
                        if (!controller.formKey.currentState!.validate()) {
                          Get.snackbar(
                            "Error",
                            "Please enter valid mobile number",
                          );
                          return;
                        }

                        if (!controller.isChecked.value) {
                          Get.snackbar(
                            "Terms Required",
                            "Please agree to Terms & Conditions",
                          );
                          return;
                        }

                        controller.showSimplePopup();
                      },

                      icon: Icon(Icons.arrow_forward_ios),
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
