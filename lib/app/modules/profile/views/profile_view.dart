import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),

            Stack(
              children: [
                /// 🔹 Image
                Container(
                  height: 390,
                  width: 333,
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
                        Icon(Icons.close, color: Color(0XFFFFFFFF), size: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: 333,
              height: 55,
              color: Color(0XFFFFFFFF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// 🔹 Name + Profession
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jackson, 32", style: SemiPop),
                      Text("Engineer", style: RegReg),
                    ],
                  ),

                  /// 🔹 Edit Button
                  Container(
                    height: 50,
                    width: 51.23,
                    decoration: BoxDecoration(
                      color: Color(0xFF3C006B),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.mode_edit,
                      color: Color(0XFFFFFFFF),
                      size: 24.29,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 33,
              width: 333,
              color: Color(0XFFFFFFFF),
              child: Row(
                children: [genderProfile(title: "Man", icon: Icons.male)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
