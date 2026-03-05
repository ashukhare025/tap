import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Model/matches.dart';

class DiscoverController extends GetxController {
  final List<String> tabs = ["Discover", "Request", "Stories", "Matches"];
  RxInt selectedIndex = 0.obs;

  TextEditingController searchController = TextEditingController();
  var name = "Aditya Kumar".obs;
  var age = 30.obs;
  var profession = "Graphic Designer".obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void likeProfile() {
    print("Liked");
  }

  void dislikeProfile() {
    print("Disliked");
  }

  RxList<MatchModel> matches = <MatchModel>[].obs;

  RxList<MatchModel> filteredMatches = <MatchModel>[].obs;

  @override
  void onInit() {
    loadMatches();
    filteredMatches.assignAll(matches);
    searchController.addListener(searchMatches);
    super.onInit();
  }

  void loadMatches() {
    matches.value = [
      MatchModel(
        name: "Alex Linderson",
        bio: "Romantic & Calm",
        active: "Active 5 min ago",
        image: "assets/image/alesx.png",
        // isOnline: true,
      ),
      MatchModel(
        name: "Angel Dayna",
        bio: "Spontaneous & Fun",
        active: "Active 15 min ago",
        image: "assets/image/angle.jpg",
        // isOnline: true,
      ),
      MatchModel(
        name: "John Abraham",
        bio: "Romantic & Fun",
        active: "Active 30 min ago",
        image: "assets/image/jhon.png",
        // isOnline: false,
      ),
      MatchModel(
        name: "Sabila Sayma",
        bio: "Romantic & Calm",
        active: "Active 16 min ago",
        image: "assets/image/sabila.png",
        // isOnline: false,
      ),
      MatchModel(
        name: "John Borino",
        bio: "Romantic & Calm",
        active: "Active 26 min ago",
        image: "assets/image/boribo.png",
        // isOnline: false,
      ),
    ];
  }

  void searchMatches() {
    String query = searchController.text.toLowerCase();

    if (query.isEmpty) {
      filteredMatches.value = matches;
    } else {
      filteredMatches.assignAll(
        matches.where((match) => match.name.toLowerCase().contains(query)),
      );
    }
  }
}
