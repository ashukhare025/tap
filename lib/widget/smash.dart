import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app/modules/discover/controllers/discover_controller.dart';
import '../core/constant/styles.dart';

Widget discoverTab() {
  return Column(
    children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 333,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("assets/image/person_pic.jpg"),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 303,
              height: 90,
              decoration: BoxDecoration(
                color: Color(0XFFFFFFFF),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 20),
                    child: Row(
                      children: [
                        Text("Aditya Kumar", style: SemiPop),
                        SizedBox(width: 5),
                        Text("- 30", style: SemiPop),
                        SizedBox(width: 50),
                        GestureDetector(
                          onTap: () {
                            print("tapped");
                          },
                          child: Icon(Icons.keyboard_arrow_up, size: 24),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("Graphics Designer", style: ExLight),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 80),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0XFFFFFFFF),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  "assets/image/share.png",
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              width: 110,
              height: 55,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.close, color: Colors.red, size: 32),
                  Icon(
                    Icons.sentiment_satisfied,
                    color: Color(0XFF2F5D62),
                    size: 32,
                  ),
                ],
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0XFFFFFFFF),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  "assets/image/light.png",
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget requestTab(controller) {
  return Column(
    children: [
      Expanded(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.filteredMatches.length,
            itemBuilder: (context, index) {
              final match = controller.filteredMatches[index];
              return Container(
                width: 333,
                height: 143,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    /// PROFILE IMAGE
                    CircleAvatar(
                      radius: 31,
                      backgroundImage: AssetImage(match.image),
                    ),

                    SizedBox(width: 12),

                    /// TEXT AREA
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// NAME
                          Text(match.name, style: PopMed),
                          SizedBox(height: 4),

                          /// BIO
                          Text(match.bio, style: PopReBla),
                          SizedBox(height: 4),

                          /// ACTIVE TIME
                          Text(match.active, style: PopReBla),
                          SizedBox(height: 10),

                          /// BUTTON ROW
                          Row(
                            children: [
                              /// MESSAGE BUTTON
                              Container(
                                width: 120,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Color(0XFFE07A5F),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text("Confirm", style: PopMedWhi),
                                ),
                              ),
                              SizedBox(width: 10),

                              /// VIEW PROFILE
                              Container(
                                width: 120,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Color(0XFFDF2D30),
                                  border: Border.all(color: Color(0XFFDF2D30)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text("Delete", style: PopMediu),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ],
  );
}

Widget storiesTab(controller) {
  return SizedBox(
    width: double.infinity,
    height: 400,
    child: Stack(
      children: [
        // Background image
        Image.asset(
          "assets/image/person_pic.jpg",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 15,
          right: 15,
          child: GestureDetector(
            onTap: () {},
            child: Icon(Icons.photo, color: Colors.white, size: 24),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 375,
            height: 156,
            color: Colors.black.withOpacity(0.6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Text("Sat, 22 Nov, 7:00PM", style: PopReGu),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Text(
                    "Arijit Singh -| Am Home India",
                    style: MediumPopiMedi,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Text("Tour 2025-26 | Indore", style: MediumPopiMedi),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Text("India", style: MediumPopiMedi),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.purple),
                      Text("5Km away ", style: PopReGu),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget matchesTab(controller) {
  return Column(
    children: [
      /// SEARCH BAR
      Container(
        width: 335,
        height: 40,
        child: TextField(
          controller: controller.searchController,
          decoration: InputDecoration(
            hintText: "Search Matches",
            hintStyle: TextRegular,
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0XFF000000)),
            ),
          ),
        ),
      ),

      /// MATCH LIST
      Expanded(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.filteredMatches.length,
            itemBuilder: (context, index) {
              final match = controller.filteredMatches[index];
              return Container(
                width: 333,
                height: 143,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    /// PROFILE IMAGE
                    CircleAvatar(
                      radius: 31,
                      backgroundImage: AssetImage(match.image),
                    ),

                    SizedBox(width: 12),

                    /// TEXT AREA
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// NAME
                          Text(match.name, style: PopMed),
                          SizedBox(height: 4),

                          /// BIO
                          Text(match.bio, style: PopReBla),
                          SizedBox(height: 4),

                          /// ACTIVE TIME
                          Text(match.active, style: PopReBla),
                          SizedBox(height: 10),

                          /// BUTTON ROW
                          Row(
                            children: [
                              /// MESSAGE BUTTON
                              Container(
                                width: 120,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Color(0XFF2F5D62),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text("Message", style: PopMedWhi),
                                ),
                              ),
                              SizedBox(width: 10),

                              /// VIEW PROFILE
                              Container(
                                width: 120,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Color(0XFFE07A5F),
                                  border: Border.all(color: Color(0XFFE07A5F)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text("View Profile", style: PopMediu),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ],
  );
}
