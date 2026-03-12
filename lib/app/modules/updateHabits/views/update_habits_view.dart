import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../controllers/update_habits_controller.dart';

class UpdateHabitsView extends GetView<UpdateHabitsController> {
  const UpdateHabitsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Text("Update your Habits", style: PopSemiBol),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 21),
            child: Text(
              "Do their habits match yours? You go first.",
              style: PopiReq,
            ),
          ),
          SizedBox(height: 30),
          // ✅ DRINK SECTION
          Padding(
            padding: EdgeInsets.only(left: 21),
            child: Text("How often do you drink?", style: MediumPopMed),
          ),
          SizedBox(height: 15),
          // DRINK SECTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // ✅ 2 items per row
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.5, // ✅ Width/height ratio adjust karo
              ),
              itemCount: controller.drinkOptions.length,
              itemBuilder: (context, index) {
                final option = controller.drinkOptions[index];
                return optionWidget(
                  option: option,
                  selectedValue: controller.selectedDrink,
                );
              },
            ),
          ),

          // ✅ SMOKE SECTION
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Text("How often do you Smoke?", style: MediumPopMed),
          ),
          SizedBox(height: 10),
          // SMOKE SECTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.8,
              ),
              itemCount: controller.smokeOptions.length,
              itemBuilder: (context, index) {
                final option = controller.smokeOptions[index];
                return optionWidget(
                  option: option,
                  selectedValue: controller.selectedSmoke,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: GestureDetector(
            onTap: () {
              controller.updateHabits();
            },
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Color(0XFFE07A5F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("Update", style: PopMediu)),
            ),
          ),
        ),
      ),
    );
  }
}

Widget optionWidget({required String option, required RxString selectedValue}) {
  return GestureDetector(
    onTap: () {
      selectedValue.value = option;
    },
    child: Obx(
      () => Container(
        height: 36,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedValue.value == option
              ? Color(0XFFE6F3F4)
              : Color(0XFFEEEDEF),
          border: Border.all(color: Color(0XFFEEEDEF)),
        ),
        child: Center(child: Text(option)),
      ),
    ),
  );
}
