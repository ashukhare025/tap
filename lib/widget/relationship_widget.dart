import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../SVG/svg.dart' as SvgHelper;
import '../app/modules/IntroDetails/controllers/intro_details_controller.dart';

class RelationshipCard extends StatelessWidget {
  final String title;
  final String svgName; // IconData ko String me change kiya
  final IntroDetailsController controller;

  const RelationshipCard({
    super.key,
    required this.title,
    required this.svgName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isSelected = controller.selectedRelation.value == title;

      return GestureDetector(
        onTap: () => controller.selectedRelation.value = title,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF5A1A8B)
                : const Color(0xFFE7E5EA),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              SvgHelper.icon(
                svgName,
                width: 28,
                height: 28,
                color: isSelected ? Colors.white : Colors.black,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.white : Colors.black,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      );
    });
  }
}
