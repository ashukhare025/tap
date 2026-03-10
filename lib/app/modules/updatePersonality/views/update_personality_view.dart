import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../controllers/update_personality_controller.dart';

class UpdatePersonalityView extends GetView<UpdatePersonalityController> {
  const UpdatePersonalityView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text("Update Your Personality", style: PopSemiBol),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text(
              "You can change this later. It’ll show on \nyour profile.",
              style: PopRe,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Personality(
                title: "Introvert",
                icon: Icons.psychology,
                controller: controller,
              ),
              Personality(
                title: "Extrovert",
                icon: Icons.psychology,
                controller: controller,
              ),
            ],
          ),
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
