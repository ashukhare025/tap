import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';

class ProfileController extends GetxController {
  var selectedGender = "".obs;
  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  RxList<String> vibes = <String>[
    "Calm",
    "Dance",
    "Romantic",
    "Spontaneous",
  ].obs;

  RxList<String> language = <String>["English", "Hindi"].obs;


}

class GenderProfile extends StatelessWidget {
  final String title;
  final IconData icon;

  const GenderProfile({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    // return Obx(() {
    //   final isSelected = controller.selectedGender.value == title;
    //
    //   return GestureDetector(
    //     onTap: () => controller.selectGender(title),
    //     child: Container(
    //       padding: const EdgeInsets.symmetric(vertical: 6),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(14),
    //         border: Border.all(
    //           width: 1,
    //           color: isSelected ? Colors.purple : Colors.grey,
    //         ),
    //         color: isSelected ? Colors.purple.withOpacity(0.1) : Colors.white,
    //       ),
    //       child: Row(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Icon(
    //             icon,
    //             size: 16,
    //             color: isSelected ? Colors.purple : Colors.black,
    //           ),
    //           const SizedBox(width: 5),
    //           Text(title, style: RegReg),
    //         ],
    //       ),
    //     ),
    //   );
    // });
    return Obx(() {
      final isSelected = controller.selectedGender.value == title;

      return GestureDetector(
        onTap: () => controller.selectGender(title),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14.65,
              color: isSelected ? Colors.black : Colors.black,
            ),
            const SizedBox(width: 5),
            Text(title, style: RegReg),
          ],
        ),
      );
    });
  }
}

Widget vibeChip(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Color(0xFF3C006B),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(text, style: PopReGu),
  );
}

Widget language(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Color(0xFF3C006B),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(text, style: PopReGu),
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
