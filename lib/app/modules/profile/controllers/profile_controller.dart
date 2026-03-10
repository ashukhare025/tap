import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';

class ProfileController extends GetxController {
  var isVerified = false.obs;
  RxList<String> vibes = <String>[
    "Calm",
    "Dance",
    "Romantic",
    "Spontaneous",
  ].obs;

  RxList<String> language = <String>["English", "Hindi"].obs;

  // 🔹 Basic Info
  RxString name = "Jackson".obs;
  RxString profession = "Engineer".obs;
  RxString about =
      "I am a good listener who enjoys meaningful conversation to understand and appreciate each other's perspectives."
          .obs;

  // 🔹 Personal Details
  RxString gender = "Man".obs;
  RxString relationship = "Single".obs;
  RxString personality = "Introvert".obs;

  RxString smoke = "Non-smoker".obs;
  RxString drink = "Occasionally".obs;

  RxString selectedDate = "".obs;

  // 🔹 Multiple Selection
  // RxList<String> vibes = <String>[].obs;
  // RxList<String> language = <String>[].obs;
}

class GenderProfile extends StatelessWidget {
  final String title;
  final IconData icon;

  const GenderProfile({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14.65, color: Colors.black),
        const SizedBox(width: 5),
        Text(title, style: RegReg),
      ],
    );
  }
}

Widget vibeChip(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Color(0xFFE6F3F4),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(text, style: RegReg),
  );
}

Widget language(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Color(0xFFE6F3F4),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(text, style: RegReg),
  );
}

// Widget socialMedia(String text) {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     decoration: BoxDecoration(
//       color: Color(0xFF3C006B),
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Text(text, style: PopReGu),
//   );
// }
