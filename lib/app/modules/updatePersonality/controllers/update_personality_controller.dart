import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';

class UpdatePersonalityController extends GetxController {
  var selectedPersonal = ''.obs;
  void selectPersonal(String personal) {
    selectedPersonal.value = personal;
  }
}

class Personality extends StatelessWidget {
  final String title;
  final IconData icon;
  final UpdatePersonalityController controller;

  const Personality({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isSelected = controller.selectedPersonal.value == title;

      return GestureDetector(
        onTap: () => controller.selectPersonal(title),
        child: Container(
          width: 150,
          height: 150,
          padding: EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Color(0xFFEEEDEF),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isSelected ? Color(0xFF2F5D62) : Colors.transparent,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
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
