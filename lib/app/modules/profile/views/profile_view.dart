import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0XFFFFFFFF),
        title: Text('Profile', style: PopSemiBol),
        centerTitle: true,
        leading: SizedBox(
          width: 14,
          height: 26,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.keyboard_arrow_left_rounded),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.settings, size: 24),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Stack(
                  children: [
                    /// 🔹 Image
                    Container(
                      height: 390,
                      width: 333,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/image/person_pic.jpg",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 333,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0XFF3C006B),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Verified your profile", style: PopSemibold),
                            Icon(
                              Icons.close,
                              color: Color(0XFFFFFFFF),
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Container(
                  width: 333,
                  height: 70,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Jackson, 32", style: SemiPop),
                              SizedBox(width: 5),
                              Image.asset(
                                "assets/image/verified.png",
                                height: 22,
                                width: 22,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                          Text("Engineer", style: RegReg),
                        ],
                      ),

                      /// 🔹 Edit Button
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF3C006B),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              print("Tapped");
                              Get.toNamed(Routes.editProfile);
                            },
                            child: Image.asset(
                              "assets/image/Edit.png",
                              height: 24,
                              width: 24,
                              fit: BoxFit.contain,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21, right: 15),
                child: Container(
                  width: 333,
                  height: 33,
                  color: Color(0XFFFFFFFF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GenderProfile(title: "Man", icon: Icons.male),
                      GenderProfile(title: "Single", icon: Icons.man),
                      GenderProfile(title: "Introvert", icon: Icons.psychology),
                    ],
                  ),
                ),
              ),
              Divider(height: 10, thickness: 1, endIndent: 15, indent: 20),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About", style: PopMed),
                    SizedBox(height: 5),
                    Text(
                      "I am a good listener who enjoys meaningful conversation "
                      "to understand and appreciate each other's perspectives.",
                      style: RegReg,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 10, thickness: 1, endIndent: 15, indent: 20),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Vibes", style: PopMed)],
                ),
              ),
              SizedBox(height: 10),
              // Row(
              //   children: [
              //     vibesCard("Calm", Colors.blue),
              //     SizedBox(width: 5),
              //     vibesCard("Dance", Colors.blue),
              //     SizedBox(width: 5),
              //     vibesCard("Romantic", Colors.blue),
              //     SizedBox(width: 5),
              //     vibesCard("Spontaneous", Colors.blue),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Obx(
                  () => Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.start,
                    children: controller.vibes
                        .map((vibe) => vibeChip(vibe))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 10, thickness: 1, endIndent: 15, indent: 20),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Text("Language Known", style: PopMed),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Obx(
                  () => Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.start,
                    children: controller.language
                        .map((vibe) => language(vibe))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 10, thickness: 1, endIndent: 15, indent: 20),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Text("Smoke", style: PopMed),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFF3C006B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("Non-Smoker", style: PopReGu),
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 10, thickness: 1, endIndent: 15, indent: 20),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Text("Drink", style: PopMed),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFF3C006B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("Occassionally", style: PopReGu),
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 10, thickness: 1, endIndent: 15, indent: 20),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Text("Social Media", style: PopMed),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 74),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color: Color(0xFF3C006B),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.facebook,
                        size: 18.8,
                        color: Color(0XFFFFFFFF),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF3C006B),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/image/insta.png",
                        height: 18.8,
                        width: 16.8,
                        color: Color(0XFFFFFFFF),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF3C006B),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/image/in.png",
                        height: 18.8,
                        width: 16.8,
                        color: Color(0XFFFFFFFF),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF3C006B),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/image/X.png",
                        height: 18.8,
                        width: 16.8,
                        color: Color(0XFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
