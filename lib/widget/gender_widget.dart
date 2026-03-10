import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app/modules/IntroDetails/controllers/intro_details_controller.dart';
import '../core/constant/styles.dart';

class GenderCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final IntroDetailsController controller;

  const GenderCard({
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
