import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/styles.dart';

class IntroDetailsController extends GetxController {
  // ------------------------------
  // TextEditingControllers
  // ------------------------------
  TextEditingController nameController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  // ------------------------------
  // Form Key for email validation
  // ------------------------------
  final emailFormKey = GlobalKey<FormState>();

  // ------------------------------
  // Observable variables for user inputs
  // ------------------------------
  var name = ''.obs; // User name
  var selectedDay = 1.obs; // Selected day for DOB
  var selectedMonth = 1.obs; // Selected month for DOB
  var selectedYear = DateTime(1950).year.obs; // Selected year for DOB

  // ------------------------------
  // Month Names
  // ------------------------------
  final months = const [
    "Jan",
    "Feb",
    "March",
    "April",
    "May",
    "June",
    "July",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  // ------------------------------
  // Days and Years List
  // ------------------------------
  List<int> get days {
    final maxDays = DateUtils.getDaysInMonth(
      selectedYear.value,
      selectedMonth.value,
    );
    return List.generate(maxDays, (i) => i + 1); // 1..maxDays
  }

  List<int> get years {
    return List.generate(
      2026 - 1950 + 1, // total years
      (index) => 1950 + index,
    );
  }

  // ------------------------------
  // Update DOB selection
  // ------------------------------
  void updateMonth(int month) {
    selectedMonth.value = month;

    final maxDays = DateUtils.getDaysInMonth(
      selectedYear.value,
      selectedMonth.value,
    );

    if (selectedDay.value > maxDays) {
      selectedDay.value = maxDays;
      dayCtrl.jumpToItem(maxDays - 1); // scroll picker
    }
  }

  void updateYear(int year) {
    selectedYear.value = year;

    final maxDays = DateUtils.getDaysInMonth(
      selectedYear.value,
      selectedMonth.value,
    );

    if (selectedDay.value > maxDays) {
      selectedDay.value = maxDays;
      dayCtrl.jumpToItem(maxDays - 1);
    }
  }

  // ------------------------------
  // Scroll Controllers for Pickers
  // ------------------------------
  late FixedExtentScrollController monthCtrl;
  late FixedExtentScrollController dayCtrl;
  late FixedExtentScrollController yearCtrl;

  @override
  void onInit() {
    super.onInit();

    final maxYear = DateTime.now().year; // 2026 for example
    selectedYear.value = 1990; // start from 1990

    monthCtrl = FixedExtentScrollController(
      initialItem: selectedMonth.value - 1,
    );

    dayCtrl = FixedExtentScrollController(initialItem: selectedDay.value - 1);

    yearCtrl = FixedExtentScrollController(
      initialItem: 0, // 1990 pe scroll start
    );
  }

  // ------------------------------
  // Full DOB string
  // ------------------------------
  String get fullDob =>
      "${months[selectedMonth.value - 1]} "
      "${selectedDay.value}, "
      "${selectedYear.value}";

  // ------------------------------
  // Stepper
  // ------------------------------
  var currentStep = 1.obs; // current step in intro process
  final totalSteps = 9; // total steps

  // ------------------------------
  // Gender selection
  // ------------------------------
  var selectedGender = "".obs;

  // ------------------------------
  // Email Controller
  // ------------------------------
  TextEditingController emailController = TextEditingController();

  @override
  void onClose() {
    // Dispose all controllers
    nameController.clear();
    nameController.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    monthCtrl.dispose();
    dayCtrl.dispose();
    yearCtrl.dispose();
    super.onClose();
  }

  // ------------------------------
  // Step navigation
  // ------------------------------
  void nextStep() {
    if (currentStep.value < totalSteps) currentStep.value++;
  }

  void previousStep() {
    if (currentStep.value > 1) currentStep.value--;
  }

  // ------------------------------
  // Bottom Text for each step
  // ------------------------------
  String getBottomText() {
    switch (currentStep.value) {
      case 3:
        return "Not now";
      case 4:
      case 5:
        return "You’ll only be shown to people in the same \nmode as you.";
      case 6:
      case 7:
      case 8:
      case 9:
        return "Skip";
      default:
        return "";
    }
  }

  bool isInfoText() {
    return currentStep.value == 4 || currentStep.value == 5;
  }

  // ------------------------------
  // Gender selection
  // ------------------------------
  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  // ------------------------------
  // Age calculation
  // ------------------------------
  bool get isValidDob => fullDob != "Not selected";
  int get age => DateTime.now().year - selectedYear.value;
  // ------------------------------
  // Email validation
  // ------------------------------
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email";
    }

    return null; // valid
  }

  void showEmailConfirmPopup() {
    Get.dialog(
      Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Want to keep up to dat with all things Tap?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 16),
                Text(
                  "We need to make sure that\n${emailController.text} is your email.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        nextStep();
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A73E8),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        nextStep();
                      },
                      child: Text(
                        "Maybe later",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A73E8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  // ------------------------------
  // User Type Selection
  // ------------------------------
  var selectedType = ''.obs;
  void selectType(String type) {
    selectedType.value = type;
  }

  // ------------------------------
  // Image Picker & Gallery
  // ------------------------------
  void removePhoto(int index) {
    photos[index] = null;
  }

  final ImagePicker _picker = ImagePicker();
  RxList<File?> photos = List<File?>.filled(4, null).obs;
  void pickImage(int index) {
    Get.bottomSheet(
      Container(
        height: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.elliptical(40, 40)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add Photo", style: PopSemiblc),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.close, size: 24),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("Try to find ones that show off your smile.", style: Regpop),
            SizedBox(height: 20),
            ListTile(
              leading: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: Color(0XFFEEEDEF),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.camera_alt, size: 24),
              ),
              title: Text("Camera", style: CarosBold),
              onTap: () async {
                Get.back();
                final XFile? image = await _picker.pickImage(
                  source: ImageSource.camera,
                );
                if (image != null) {
                  photos[index] = File(image.path);
                }
              },
            ),
            Divider(thickness: 0),
            ListTile(
              leading: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: Color(0XFFEEEDEF),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.photo, size: 24),
              ),
              title: Text("Media", style: CarosBold),
              subtitle: Text("Share photos and videos", style: BookReg),
              onTap: () async {
                Get.back();
                final XFile? image = await _picker.pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null) {
                  photos[index] = File(image.path);
                }
              },
            ),
            Divider(thickness: 0),
          ],
        ),
      ),
    );
  }

  /// ------------------------------
  /// Validation (minimum 4 photos)
  /// ------------------------------
  bool validatePhotos() {
    int count = photos.where((p) => p != null).length;
    if (count < 4) {
      Get.snackbar("Error", "Please add at least 4 photos");
      return false;
    }
    return true;
  }

  // ------------------------------
  // Relationship Selection
  // ------------------------------
  RxString selectedRelation = "".obs;
  void selectRelation(String relation) {
    selectedRelation.value = relation;
  }

  // ------------------------------
  // Language Selection
  // ------------------------------
  var selectedLanguage = ''.obs;
  var searchText = ''.obs;

  List<Map<String, String>> allLanguages = [
    {'name': 'Arabic', 'flag': '🇦🇪'},
    {'name': 'Spanish', 'flag': '🇪🇸'},
    {'name': 'French', 'flag': '🇫🇷'},
    {'name': 'German', 'flag': '🇩🇪'},
    {'name': 'Hindi', 'flag': '🇮🇳'},
    {'name': 'Korean', 'flag': '🇰🇷'},
    {'name': 'Vietnamese', 'flag': '🇻🇳'},
  ];

  List<Map<String, String>> get filteredLanguages {
    if (searchText.value.isEmpty) return allLanguages;
    return allLanguages
        .where(
          (lang) => lang['name']!.toLowerCase().contains(
            searchText.value.toLowerCase(),
          ),
        )
        .toList();
  }

  void selectLanguage(String language) {
    selectedLanguage.value = language;
  }

  // ------------------------------
  // Personal Type Selection
  // ------------------------------
  var selectedPersonal = ''.obs;
  void selectPersonal(String personal) {
    selectedPersonal.value = personal;
  }

  // ------------------------------
  // Energy / Interests
  // ------------------------------
  final interested = [
    "Calm",
    "Peaceful",
    "Cozy",
    "Nature",
    "Party",
    "Dance",
    "Loud Music",
    "Fun",
    "Outgoing",
    "Goofy",
    "Romantic",
    "Deep Talks",
    "Spontaneous",
    "Adrenaline Junkie",
    "Travel Buff",
  ];

  RxList<String> selectedInterests = <String>[].obs;
  int maxSelection = 5;

  void toggleInterest(String value) {
    if (selectedInterests.contains(value)) {
      selectedInterests.remove(value);
    } else {
      if (selectedInterests.length >= maxSelection) {
        Get.snackbar("Limit", "You can select only $maxSelection");
        return;
      }
    }
    selectedInterests.add(value);
  }

  bool validateVibes() {
    if (selectedInterests.length < 5) {
      Get.snackbar("Error", "Select at least 5 categories");
      return false;
    }
    return true;
  }

  // ------------------------------
  // Relationship List Data
  // ------------------------------
  final List<Map<String, dynamic>> relationshipList = [
    {'title': "Single", 'svgName': 'bachelor'},
    {'title': "Relationship", 'svgName': 'love'},
    {'title': "Engaged", 'svgName': 'ring'},
    {'title': "Married", 'svgName': 'wedding'},
    {'title': "Divorced", 'svgName': 'broken-heart'},
    {'title': "Widowed", 'svgName': 'elder'},
  ];

  //
  RxInt selectedIndex = 0.obs;
  List<String> moods = ["Calm", "Social", "Romantic", "Adventure", "Growth"];

  RxString selectedTab = "Calm".obs;
  // ------------------------------
  // Energy / Interests Category
  // ------------------------------

  Map<String, List<String>> vibeCategories = {
    "Calm": ["Calm", "Peaceful", "Cozy", "Nature"],
    "Social": ["Party", "Dance", "Loud Music", "Fun", "Outgoing", "Goofy"],
    "Romantic": ["Romantic", "Deep Talks"],
    "Adventure": ["Spontaneous", "Adrenaline Junkie", "Travel Buff"],
  };

  void changeTab(String tab) {
    selectedTab.value = tab;
  }
}
