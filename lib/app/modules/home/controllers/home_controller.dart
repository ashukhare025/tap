import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Model/event_model.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();

  var currentIndex = 2.obs;
  var currentPage = 0.obs;
  PageController pageController = PageController(viewportFraction: 0.88);

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  List<EventModel> events = [
    EventModel(
      image: "assets/image/arjit.jpg",
      title: "Arijit Singh – I Am Home India Tour 2025–26 | Indore",
      date: "Sat, 22 Nov, 7:00PM",
      location: "India",
      rating: 4.1,
    ),
    EventModel(
      image: "assets/image/smash.png",
      title: "Live Concert Night | Bhopal",
      date: "Sun, 10 Dec, 6:00PM",
      location: "India",
      rating: 4.3,
    ),
    EventModel(
      image: "assets/image/person_pic.jpg",
      title: "Music Fest 2026 | Delhi",
      date: "Mon, 5 Jan, 8:00PM",
      location: "India",
      rating: 4.5,
    ),
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  //card
  var activeUsers = 100.obs;

  // Gender
  var male = 47.obs;
  var female = 45.obs;
  var other = 8.obs;

  // Age Groups
  var age18_24 = 35.0.obs;
  var age25_30 = 45.0.obs;
  var age31_40 = 20.0.obs;

  Timer? timer;
  final random = Random();

  @override
  void onInit() {
    super.onInit();
    startLiveUpdates();
  }

  void startLiveUpdates() {
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      // Active users
      activeUsers.value = 80 + random.nextInt(50);

      // Gender distribution (total = 100)
      int m = 40 + random.nextInt(20);
      int f = 40 + random.nextInt(20);
      int o = 100 - (m + f);

      male.value = m;
      female.value = f;
      other.value = o;

      // Age groups (total = 1)
      int a1 = 20 + random.nextInt(40);
      int a2 = 20 + random.nextInt(40);
      int a3 = 100 - (a1 + a2);

      age18_24.value = a1.toDouble();
      age25_30.value = a2.toDouble();
      age31_40.value = a3.toDouble();
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  var categories = [
    {"name": "Cafe", "icon": "assets/image/cafe.png"},
    {"name": "Bars", "icon": "assets/image/bars.png"},
    {"name": "Lounges", "icon": "assets/image/Lounges.png"},
    {"name": "Artists", "icon": "assets/image/artists.png"},
    {"name": "Events", "icon": "assets/image/event.png"},
  ].obs; // .obs for reactivity

  // Selected index for highlighting
  var selectedIndex = 0.obs;

  void selectCategory(int index) {
    selectedIndex.value = index;
  }
}
