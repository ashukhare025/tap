import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../bottom_nevi/bottom_navi.dart';

class AllowController extends GetxController {
  final int totalSteps = 2;

  RxInt currentPage = 0.obs;

  final PageController pageController = PageController();

  /// Next Page
  void nextPage() {
    if (currentPage.value < totalSteps - 1) {
      currentPage.value++;

      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      /// Last page action
      onFinish();
    }
  }

  /// Skip (same as next)
  void skip() {
    nextPage();
  }

  /// Finish Action
  void onFinish() {
    Get.offAll(() => BottomNavView());
  }
}
