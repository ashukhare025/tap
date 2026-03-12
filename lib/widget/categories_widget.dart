import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/modules/HomeState/controllers/home_state_controller.dart';

class CategoryChips extends StatelessWidget {
  CategoryChips({super.key});
  final controller = Get.put(HomeStateController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(controller.categories.length, (index) {
            bool isSelected = controller.selectedIndex.value == index;
            return GestureDetector(
              onTap: () => controller.selectCategory(index),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF2F5D62)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0XFF8C6DA3), width: 1),
                ),
                child: Text(
                  controller.categories[index],
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
