import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constant/styles.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController facebookController = TextEditingController();

  var openDropdown = "".obs;
  RxString gender = "Man".obs;
  RxString relationship = "Single".obs;
  RxString personality = "Introvert".obs;
  RxString language = "English".obs;
  RxString smoke = "Non-smoker".obs;
  RxString drink = "Occassionally".obs;

  final List<String> genderOptions = ["Man", "Woman", "Other"];
  final List<String> relationshipOptions = ["Single", "Married", "Divorced"];
  final List<String> personalityOptions = ["Introvert", "Extrovert"];
  final List<String> languageOption = ["English", "Hindi"];
  final List<String> smokeOption = ["Non-smoker", "smoker"];
  final List<String> drinkOption = ["Occassionally", "Occassionally"];

  // image camera Gallery
  void removePhoto(int index) {
    photos[index] = null;
    photos.refresh();
  }

  final ImagePicker _picker = ImagePicker();
  RxList<File?> photos = List<File?>.filled(4, null).obs;
  void pickFromGallery(int index) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      photos[index] = File(image.path);
      photos.refresh();
    }
  }

  void pickFromCamera(int index) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      photos[index] = File(image.path);
      photos.refresh();
    }
  }

  /// Validation (minimum 4 photos)
  bool validatePhotos() {
    int count = photos.where((p) => p != null).length;
    if (count < 4) {
      Get.snackbar("Error", "Please add at least 4 photos");
      return false;
    }
    return true;
  }

  // vibes tap
  var isOpen = false.obs; // expansion control
  var selectedVibe = "".obs; // selected option

  final List<String> vibes = ["Calm", "Dance", "Romantic", "Spontaneous"];

  void toggleOpen() => isOpen.value = !isOpen.value;

  void selectVibe(String vibe) {
    selectedVibe.value = vibe;
    isOpen.value = false; // close after select
  }

  // Date birth

  var selectedDate = "".obs; // selected date
  void selectDate(String date) {
    selectedDate.value = date;
    isOpen.value = false; // close dropdown
  }

  // social media
  RxList<Map<String, String>> socialList = [
    {"image": "assets/image/facbook.png", "url": "https://www.facebook.com/"},
    {"image": "assets/image/insta.png", "url": "https://www.instagram.com/"},
    {"image": "assets/image/in.png", "url": "https://www.linkedin.com/"},
    {"image": "assets/image/X.png", "url": "https://twitter.com/"},
  ].obs;
  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      Get.snackbar("Error", "Could not open link");
    }
  }
}

// Widget
Widget profileRow({
  required String title,
  required RxString value,
  required List<String> options,
  required EditProfileController controller,
}) {
  return Column(
    children: [
      Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Title
              Text(title, style: PopMed),

              /// Value + Icon
              GestureDetector(
                onTap: () {
                  // Toggle dropdown for this row
                  controller.openDropdown.value =
                      controller.openDropdown.value == title ? "" : title;
                },
                child: Row(
                  children: [
                    Text(
                      value.value,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios, size: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// Dropdown Options
      Obx(
        () => controller.openDropdown.value == title
            ? Column(
                children: options.map((opt) {
                  return GestureDetector(
                    onTap: () {
                      value.value = opt;
                      controller.openDropdown.value = ""; // close dropdown
                    },
                    child: Container(
                      width: double.infinity,
                      color: Colors.grey[200],
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: Text(opt),
                    ),
                  );
                }).toList(),
              )
            : SizedBox(),
      ),
    ],
  );
}
