import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';

class UpdateGenderController extends GetxController {
  var selectedGender = "".obs;
  void selectGender(String gender) {
    selectedGender.value = gender;
  }
}

class Gender extends StatelessWidget {
  final String title;
  final IconData icon;
  final UpdateGenderController controller;

  const Gender({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isSelected = controller.selectedGender.value == title;

      return GestureDetector(
        onTap: () => controller.selectGender(title),
        child: Container(
          width: 100,
          padding: EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: isSelected ? Color(0XFFFFFFFF) : Color(0XFFEEEDEF),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? Color(0xFF6A1B9A) : Colors.transparent,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Icon(icon, size: 24, color: Colors.black),
              SizedBox(height: 8),
              Text(title, style: RegSan),
            ],
          ),
        ),
      );
    });
  }
}
