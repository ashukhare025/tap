import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_state_controller.dart';

class CheckInView extends GetView<HomeStateController> {
  const CheckInView({super.key});

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 9.5),
            child: Image.asset("assets/image/smash.png"),
          ),
        ],
      ),
    );
  }
}
