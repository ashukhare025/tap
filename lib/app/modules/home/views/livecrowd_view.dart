import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap/app/modules/home/controllers/home_controller.dart';

import '../../../../core/constant/styles.dart';
import '../../../../widget/live_crowd.dart';
import '../../../routes/app_pages.dart';

class LiveCrowdView extends GetView<HomeController> {
  const LiveCrowdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 12,
        title: GestureDetector(
          onTap: () {
            print("Change location");
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Color(0XFFABAAB3), size: 22),
              SizedBox(width: 5),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
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

        actions: [
          Icon(Icons.favorite_border, size: 24, color: Color(0XFF303C42)),
          SizedBox(width: 10),
          Icon(Icons.notifications_none, size: 24, color: Color(0XFF303C42)),
          SizedBox(width: 10),
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: GestureDetector(
              onTap: () {
                print("Profile clicked");
                Get.toNamed(Routes.profile);
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
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: controller.searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: Color(0xFF000000),
                    ),
                    hintText: " Search cafes, bars, lounges, artists…",
                    hintStyle: PopRegu,
                    filled: true,
                    fillColor: Color(0xFFEEEDEF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0XFFEEEDEF),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0XFFEEEDEF),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0XFFEEEDEF),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: List.generate(controller.categories.length, (
                      index,
                    ) {
                      var category = controller.categories[index];
                      bool isSelected = controller.selectedIndex.value == index;

                      return GestureDetector(
                        onTap: () => controller.selectCategory(index),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                category["icon"]!,
                                height: 38,
                                width: 38,
                              ),
                              SizedBox(height: 4),
                              Text(category["name"]!, style: PopMedium),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1, color: Color(0xFFD9D9D9)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("TRENDING NOW", style: PopSemibol),
                  ),

                  Expanded(
                    child: Divider(thickness: 1, color: Color(0xFFD9D9D9)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              liveCrowdCard(HomeController()),
            ],
          ),
        ),
      ),
    );
  }
}
