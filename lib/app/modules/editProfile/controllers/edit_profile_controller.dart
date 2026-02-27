import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/styles.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  RxString gender = "Man".obs;
  RxString relationship = "Single".obs;
  RxString personality = "Introvert".obs;

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
}

Widget profileRow({
  required String title,
  required RxString value,
  required VoidCallback onChange,
}) {
  return Obx(
    () => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Left Title
          Text(title, style: PopMed),

          /// Middle Value
          Row(
            children: [
              Text(
                value.value,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 5),

              /// Right Button
              GestureDetector(
                onTap: onChange,
                child: Icon(Icons.arrow_forward_ios, size: 15),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
