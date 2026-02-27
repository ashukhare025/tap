import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
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
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
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
              profileRow(
                title: "Gender",
                value: controller.gender,
                onChange: () {
                  controller.gender.value = controller.gender.value == "Man"
                      ? "Woman"
                      : "Man";
                },
              ),
              profileRow(
                title: "Status",
                value: controller.relationship,
                onChange: () {
                  controller.relationship.value =
                      controller.relationship.value == "Single"
                      ? "Married"
                      : "Single";
                },
              ),
              profileRow(
                title: "Personality",
                value: controller.personality,
                onChange: () {
                  controller.personality.value =
                      controller.personality.value == "Introvert"
                      ? "Extrovert"
                      : "Introvert";
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
