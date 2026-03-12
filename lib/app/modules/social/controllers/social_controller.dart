import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Model/event_model.dart';

class SocialController extends GetxController {
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

  var categories = [
    {"name": "Cafe", "icon": "assets/image/cafe.png"},
    {"name": "Bars", "icon": "assets/image/bars.png"},
    {"name": "Lounges", "icon": "assets/image/Lounges.png"},
    {"name": "Artists", "icon": "assets/image/artists.png"},
    {"name": "Events", "icon": "assets/image/event.png"},
  ].obs; // .obs for reactivity
  var selectedIndex = 0.obs;

  void selectCategory(int index) {
    selectedIndex.value = index;
  }
}
