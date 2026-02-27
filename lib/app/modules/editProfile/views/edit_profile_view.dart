import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/app_constants.dart';
import '../../../../core/constant/styles.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  final ProfileController profileController = Get.find<ProfileController>();
  EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: const Text('Edit Profile'),
        leading: SizedBox(
          width: 14,
          height: 26,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.keyboard_arrow_left_rounded),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),

              // Photo
              Padding(
                padding: const EdgeInsets.all(12),
                child: Obx(
                  () => GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.photos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final photo = controller.photos[index];
                      return GestureDetector(
                        onTap: () => controller.pickFromGallery(index),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0XFFEEEDEF),
                                borderRadius: BorderRadius.circular(12),
                                image: photo != null
                                    ? DecorationImage(
                                        image: FileImage(photo),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: photo == null
                                  ? Center(
                                      child: Container(
                                        height: 41,
                                        width: 41,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0XFF43116A),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),

                            if (photo != null)
                              Positioned(
                                top: 6,
                                right: 6,
                                child: GestureDetector(
                                  onTap: () => controller.removePhoto(index),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.close,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Name
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Text("Full Name", style: PopMed),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Container(
                  height: 50,
                  width: 323,
                  color: Color(0xFFFFFFFF),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: controller.nameController,
                    style: RegReg,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF525252)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF525252)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF525252)),
                      ),
                      hint: Text("Enter Name"),
                      hintStyle: RegReg,
                    ),
                  ),
                ),
              ),

              //Profession
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Text("Profession", style: PopMed),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Container(
                  height: 50,
                  width: 323,
                  color: Color(0xFFFFFFFF),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: controller.professionController,
                    style: RegReg,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF525252)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF525252)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFF525252)),
                      ),
                      hint: Text("Enter Profession"),
                      hintStyle: RegReg,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // About
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Text("About Me", style: PopMed),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: TextField(
                  controller: controller.aboutController,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  style: RegReg,
                  decoration: InputDecoration(
                    hintText: "Tell something about yourself",
                    hintStyle: MediuPopi,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFF525252)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFF525252)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFF525252)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Details List
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ----------------- Gender -----------------
                  profileRow(
                    title: "Gender",
                    value: controller.gender,
                    options: controller.genderOptions,
                    controller: controller,
                  ),

                  // ----------------- Status -----------------
                  profileRow(
                    title: "Status",
                    value: controller.relationship,
                    options: controller.relationshipOptions,
                    controller: controller,
                  ),

                  // ----------------- Personality -----------------
                  profileRow(
                    title: "Personality",
                    value: controller.personality,
                    options: controller.personalityOptions,
                    controller: controller,
                  ),

                  // ----------------- Vibes -----------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          title: Text("Vibes", style: PopMed),
                          trailing: GestureDetector(
                            onTap: controller.toggleOpen,
                            child: Icon(
                              controller.isOpen.value
                                  ? Icons.keyboard_arrow_down
                                  : Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.isOpen.value
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 8,
                                  children: controller.vibes.map((vibe) {
                                    bool isSelected =
                                        controller.selectedVibe.value == vibe;
                                    return GestureDetector(
                                      onTap: () => controller.selectVibe(vibe),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Color(0xFFEEEDEF)
                                              : Color(0xFFEEEDEF),
                                          borderRadius: BorderRadius.circular(
                                            41,
                                          ),
                                          border: Border.all(
                                            width: 2,
                                            color: isSelected
                                                ? Color(0xFFEEEDEF)
                                                : Color(0xFFEEEDEF),
                                          ),
                                        ),
                                        child: Text(
                                          vibe,
                                          style: TextStyle(
                                            color: isSelected
                                                ? Color(0xFF43116A)
                                                : Color(0xFF525252),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                AppConstants.fontFamily_Poppins,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            : SizedBox(),
                      ),
                    ],
                  ),

                  // ----------------- Date of Birth -----------------
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: Get.context!,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            String formattedDate =
                                "${_monthName(pickedDate.month)} ${pickedDate.day.toString().padLeft(2, '0')}, ${pickedDate.year}";
                            controller.selectedDate.value = formattedDate;
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date of Birth", style: PopMed),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.selectedDate.value.isEmpty
                                      ? "April 04, 1993"
                                      : controller.selectedDate.value,
                                  style: PopMed,
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_forward_ios, size: 15),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ----------------- Language Known -----------------
                  profileRow(
                    title: "Language Known",
                    value: controller.language,
                    options: controller.languageOption,
                    controller: controller,
                  ),

                  // ----------------- Smoke -----------------
                  profileRow(
                    title: "Smoke",
                    value: controller.smoke,
                    options: controller.smokeOption,
                    controller: controller,
                  ),

                  // ----------------- Drink -----------------
                  profileRow(
                    title: "Drink",
                    value: controller.drink,
                    options: controller.drinkOption,
                    controller: controller,
                  ),
                ],
              ),
              SizedBox(height: 5),

              // social media
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Text("Social Media", style: PopMed),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => Column(
                    children: List.generate(controller.socialList.length, (
                      index,
                    ) {
                      final item = controller.socialList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            // 🔵 Circular Image
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 8,
                              ),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Color(0xFF3C006B),
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  height: 16,
                                  width: 16,
                                  item["image"]!,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),

                            // 🔲 URL Box
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 12,
                                ),
                                height: 48,
                                width: 325,
                                decoration: BoxDecoration(
                                  color: Color(0XFFEEEDEF),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: GestureDetector(
                                  onTap: () =>
                                      controller.openLink(item["url"]!),
                                  child: Text(
                                    item["url"]!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),

              // Button
              GestureDetector(
                onTap: () {
                  print("Button");
                  // profileController.name.value = controller.nameController.text;
                  // profileController.profession.value =
                  //     controller.professionController.text;
                  // profileController.about.value =
                  //     controller.aboutController.text;
                  //
                  // profileController.gender.value = controller.gender.value;
                  // profileController.relationship.value =
                  //     controller.relationship.value;
                  // profileController.personality.value =
                  //     controller.personality.value;
                  //
                  // profileController.smoke.value = controller.smoke.value;
                  // profileController.drink.value = controller.drink.value;
                  //
                  // profileController.selectedDate.value =
                  //     controller.selectedDate.value;
                  //
                  // profileController.vibes.value = [
                  //   controller.selectedVibe.value,
                  // ];
                  // profileController.language.value = [
                  //   controller.language.value,
                  // ];
                  //
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    height: 48,
                    width: 333,
                    decoration: BoxDecoration(
                      color: Color(0xFF43116A),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Save", style: PopMediu)),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

String _monthName(int month) {
  const months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  return months[month - 1];
}
