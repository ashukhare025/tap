import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0XFF000E08),
                Color(0XFF43116A).withOpacity(1),
                Color(0XFF101010),
              ],
              stops: [0.10, 0.30, 0.50],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/image/tap.png",
                    color: Color(0XFFFFFFFF),
                    height: 62,
                    width: 43,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    textAlign: TextAlign.start,
                    "Connect friends easily & quickly",
                    style: Caros,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    textAlign: TextAlign.start,
                    "Our Tap app is the perfect way to stay\nconnected with friends and family.",
                    style: TextRegulaPopwhite,
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(Routes.number);
                        },
                        child: SizedBox(
                          height: 48,
                          width: 327,
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Get.offNamed(Routes.number);
                              },
                              child: Center(
                                child: Text(
                                  "Create an account",
                                  style: TextRegulaPopBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 15),
                      SizedBox(
                        height: 48,
                        width: 327,
                        child: TextButton(
                          onPressed: () {
                            // action
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Text(
                            "I have an account",
                            style: TextRegulaPopwhite,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Term & Condition,", style: TextRegulaPopwhite),
                          SizedBox(width: 5),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Private Policy",
                              style: popWhite.copyWith(
                                decorationColor: Color(0xffffffff),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
