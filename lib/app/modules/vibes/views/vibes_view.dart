import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../controllers/vibes_controller.dart';

class VibesView extends GetView<VibesController> {
  const VibesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 160,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              print("Change location");
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Color(0XFFABAAB3),
                  size: 22,
                ),
                SizedBox(width: 5),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Indore India", style: PopMedium),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Change", style: PopMdm),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: Color(0XFFABAAB3),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          Icon(Icons.favorite_border, size: 24),
          SizedBox(width: 10),
          Icon(Icons.notifications_none, size: 24),
          SizedBox(width: 10),
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: GestureDetector(
              onTap: () {
                print("Profile clicked");
              },
              child: CircleAvatar(
                radius: 21,
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=3",
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [photoCard(), SizedBox(height: 10), videoCard()],
        ),
      ),
    );
  }
}

Widget photoCard() {
  return SizedBox(
    width: double.infinity,
    height: 585,
    child: Stack(
      children: [
        Image.asset(
          "assets/image/person_pic.jpg",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),

        Positioned(
          top: 15,
          left: 15,
          child: Row(
            children: [
              Icon(Icons.location_on, color: Color(0xFF43116A)),
              Text("5Km", style: PopReGu),
            ],
          ),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: GestureDetector(
            onTap: () {
              print("Photo");
            },
            child: Icon(Icons.photo, color: Colors.white),
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
                // Padding(
                //   padding: const EdgeInsets.only(left: 12),
                //   child: Row(
                //     children: [
                //       Icon(Icons.location_on, color: Colors.purple),
                //       Text("5Km away ", style: PopReGu),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget videoCard() {
  return SizedBox(
    width: double.infinity,
    height: 585,
    child: Stack(
      children: [
        Image.asset(
          "assets/image/person_pic.jpg",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),

        Positioned(
          top: 15,
          left: 15,
          child: Row(
            children: [
              Icon(Icons.location_on, color: Color(0xFF43116A)),
              Text("5Km", style: PopReGu),
            ],
          ),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: GestureDetector(
            onTap: () {
              print("video");
            },
            child: Icon(Icons.videocam_outlined, color: Colors.white),
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
                // Padding(
                //   padding: const EdgeInsets.only(left: 12),
                //   child: Row(
                //     children: [
                //       Icon(Icons.location_on, color: Colors.purple),
                //       Text("5Km away ", style: PopReGu),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
