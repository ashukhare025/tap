import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/styles.dart';
import '../modules/chat/controllers/chat_controller.dart';
import '../modules/home/controllers/home_controller.dart';
import 'bottom_sheet.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({super.key});

  final controller = Get.find<HomeController>();

  Widget navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    return Obx(() {
      bool isSelected = controller.currentIndex.value == index;

      return GestureDetector(
        onTap: () {
          controller.changeIndex(index);
          if (index == 1) {
            openChatBottomSheet(Get.context!, Get.find<ChatController>());
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 250),
              height: isSelected ? 60 : 30,
              width: isSelected ? 60 : 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Color(0xFF6A1B9A) : Colors.transparent,
                boxShadow: isSelected
                    ? [BoxShadow(color: Colors.black26, blurRadius: 8)]
                    : [],
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.black,
                size: isSelected ? 31 : 22,
              ),
            ),
            SizedBox(height: 4),
            Text(label, style: PopMdm),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem(
            icon: Icons.account_circle_rounded,
            label: "Social",
            index: 0,
          ),
          navItem(icon: Icons.chat_bubble_outline, label: "Chat", index: 1),
          navItem(icon: Icons.home_outlined, label: "Home", index: 2),
          navItem(icon: Icons.play_circle_outline, label: "Vibes", index: 3),
          navItem(icon: Icons.settings, label: "Map", index: 4),
        ],
      ),
    );
  }
}
