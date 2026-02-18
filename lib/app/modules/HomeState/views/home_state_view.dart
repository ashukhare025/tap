import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/constant/styles.dart';
import '../../../../widget/categories_widget.dart';
import '../../../../widget/home_state_widget.dart';
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
              expandedHeight: 150,
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 0,

              title: GestureDetector(
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

              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  fit: StackFit.expand,

                  children: [
                    /// Background Image
                    ///
                    Image.asset("assets/image/arjit.jpg", fit: BoxFit.cover),
                    Positioned(
                      top: 100,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ),

                    /// Gradient overlay (for text visibility)
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

                    /// Location Text
                  ],
                ),
              ),
            ),

            /// PAGE CONTENT
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),

                  /// Buttons (Live stats / Write Review)
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
                  SizedBox(height: 10),

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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text("+91 9522143877", style: InterMed),
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
