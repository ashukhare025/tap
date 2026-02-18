import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../controllers/allow_controller.dart';

class AllowView extends GetView<AllowController> {
  const AllowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// PageView
            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  notificationPage(), // Page 1
                  locationPage(), // Page 2
                ],
              ),
            ),

            /// Indicator
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// -------- Page 1 ----------
  Widget notificationPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/image/bell.png", height: 110, width: 110),
                  SizedBox(height: 20),
                  Text("Don’t miss a beat, or a match", style: PopSemiBol),
                  SizedBox(height: 10),
                  Text(
                    "Turn on your notifications so we can let you know when you have new Knocks, retain, or messages.",
                    style: PopMedium,
                  ),
                ],
              ),
            ),
          ),

          /// Buttons
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFF000000),
              ),
              onPressed: controller.nextPage,
              child: Text("Allow notification", style: PopMediu),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: controller.skip,
            child: Text("Not now", style: PopMedium),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  /// -------- Page 2 ----------
  Widget locationPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/image/map.png", height: 110, width: 110),
                  SizedBox(height: 20),
                  Text(
                    "Allow location to discover matches and moments happening close to you.",
                    style: PopSemiBol,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Turn on your location so we can \nfind nearby matches. Your location \nis never shared.",
                    style: PopMedium,
                  ),
                ],
              ),
            ),
          ),

          /// Buttons
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFF000000),
              ),
              onPressed: controller.nextPage,
              child: Text("Allow notification", style: PopMediu),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: controller.skip,
            child: Text("Not now", style: PopMedium),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
