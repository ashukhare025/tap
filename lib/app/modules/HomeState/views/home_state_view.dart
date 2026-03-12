import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/constant/styles.dart';
import '../../../../widget/categories_widget.dart';
import '../../../../widget/home_state_widget.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/home_state_controller.dart';
import 'package:flutter_map/flutter_map.dart';

class HomeStateView extends GetView<HomeStateController> {
  const HomeStateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            /// IMAGE APP BAR
            SliverAppBar(
              toolbarHeight: 400,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                child: Stack(
                  children: [
                    // Background image
                    Image.asset(
                      "assets/image/arjit.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    // Leading icon
                    Positioned(
                      top: 40,
                      left: 10,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                    // Action icon
                    Positioned(
                      top: 40,
                      right: 10,
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: Color(0xFFFFBB1D),
                          ),
                        ),
                        child: Icon(
                          Icons.star,
                          color: Color(0xFFFFBB1D),
                          size: 20,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.transparent,
                            Colors.white,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// PAGE CONTENT
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _chipButton("Live stats", true),
                          SizedBox(width: 5),
                          _chipButton("Write Review", false),
                          SizedBox(width: 5),
                          _chipButton("Browse Gallery", false),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sat, 22 Nov, 7:00PM ", style: RobMed),
                            SizedBox(height: 6),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Arijit Singh -| Am Home IndiaTour\n2025-26 | Indore",
                                    style: PopMedium,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF2F5D62),
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 10,
                                          ),
                                          child: Text(
                                            "4.1".toString(),
                                            style: PopMedi,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                              style: Regpop,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: SizedBox(
                      width: 330.17,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFFE07A5F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Container(
                                  width: 350,
                                  height: 260,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0XFFFFFFFF),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/image/premium.png",
                                            height: 32,
                                            width: 32,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "Premium Unlocked",
                                            style: SemiBoldPop,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Congrats you got free premium membership feature",
                                        textAlign: TextAlign.center,
                                        style: TextRegulaPopBlack,
                                      ),
                                      SizedBox(height: 20),

                                      /// Feature List
                                      featureItem("Unlimited Knocks"),
                                      featureItem("Unlimited Check-ins"),
                                      featureItem("Unlimited Retains"),
                                      Divider(height: 30, thickness: 1),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.checkFailed);
                                        },
                                        child: Container(
                                          width: 180,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: Color(0XFFE07A5F),
                                          ),
                                          child: Center(
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              "Continue",
                                              style: PopSemibold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text("Check In", style: PopMediu),
                      ),
                    ),
                  ),

                  /// Your Live Crowd Card
                  homeState(Get.find<HomeController>()),

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Vibe Indicator", style: InterBol),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CategoryChips(),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Other Details", style: InterBol),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                      style: InterReqular,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Contact", style: InterBol),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FlutterMap(
                        mapController: controller.mapController,
                        options: MapOptions(
                          initialCenter: controller.initialPosition,
                          initialZoom: 13,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://tile.openstreetmap.de/{z}/{x}/{y}.png",
                            userAgentPackageName: 'com.example.tap',
                          ),

                          Obx(
                            () => MarkerLayer(
                              markers: controller.markers.toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.moveToLocation(LatLng(22.7300, 75.8700));
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}

Widget _chipButton(String text, bool selected) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    decoration: BoxDecoration(
      color: selected ? Colors.black : Colors.transparent,
      borderRadius: BorderRadius.circular(25),
      border: Border.all(color: Colors.black),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: selected ? Colors.white : Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget featureItem(String text) {
  return Padding(
    padding: EdgeInsets.only(left: 21),
    child: Row(
      children: [
        Icon(Icons.check_circle, color: Colors.lightGreen, size: 14),
        SizedBox(width: 8),
        Text(text, style: TextRegulaPopBlack),
      ],
    ),
  );
}
