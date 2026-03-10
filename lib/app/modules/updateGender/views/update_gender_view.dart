import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../controllers/update_gender_controller.dart';

class UpdateGenderView extends GetView<UpdateGenderController> {
  const UpdateGenderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Text("Update your gender", style: PopSemiBol),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Text(
              "We love that you’re here. pick the gender that best describes you, then add more about it if you like.",
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 21, right: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Gender(title: "Man", icon: Icons.male, controller: controller),
                Gender(
                  title: "Woman",
                  icon: Icons.female,
                  controller: controller,
                ),
                Gender(
                  title: "Non Binary",
                  icon: Icons.transgender,
                  controller: controller,
                ),
              ],
            ),
          ),
          SizedBox(height: 30),

          /// FOOTER NOTE
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "You can always update this later. ",
                    style: RegPopReg,
                  ),
                  TextSpan(
                    text: "A note about\ngender on Tap.",
                    style: PopSemiB,
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: Center(
          //     child: GestureDetector(
          //       onTap: () {
          //         print("tapp");
          //       },
          //       child: Container(
          //         width: 339.17,
          //         height: 48,
          //         decoration: BoxDecoration(
          //           color: Color(0XFFE07A5F),
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //         child: Center(child: Text("Update", style: PopMediu)),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: GestureDetector(
            onTap: () {
              print("tapp");
            },
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Color(0XFFE07A5F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("Update", style: PopMediu)),
            ),
          ),
        ),
      ),
    );
  }
}
