import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var selectedGender = "".obs;
  void selectGender(String gender) {
    selectedGender.value = gender;
  }
}

class genderProfile extends StatelessWidget {
  final String title;
  final IconData icon;

  const genderProfile({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        child: Container(
          width: 100,
          padding: EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(width: 1.5),
          ),
          child: Column(
            children: [
              Icon(icon, size: 28, color: Colors.black),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );
    });
  }
}
