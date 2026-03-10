import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../controllers/update_habits_controller.dart';

class UpdateHabitsView extends GetView<UpdateHabitsController> {
  const UpdateHabitsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Text("Update your Habits", style: PopSemiBol),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Text(
              "Do their habits match yours? You go first.",
              style: PopiReq,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Text("How often do you drink?", style: MediumPopMed),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 36,
                width: 109,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFFEEEDEF),
                  border: Border.all(width: 1, color: Color(0XFFEEEDEF)),
                ),
                child: Center(child: Text("Regularly")),
              ),
              Container(
                height: 36,
                width: 109,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFFE6F3F4),
                  border: Border.all(width: 1, color: Color(0XFFEEEDEF)),
                ),
                child: Center(child: Text("Occassionally")),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 36,
                width: 135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFFEEEDEF),
                  border: Border.all(width: 1, color: Color(0XFFEEEDEF)),
                ),
                child: Center(child: Text("Trying to quit")),
              ),
              Container(
                height: 36,
                width: 87,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFFEEEDEF),
                  border: Border.all(width: 1, color: Color(0XFFEEEDEF)),
                ),
                child: Center(child: Text("Rarely")),
              ),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Text("How often do you Smoke?", style: MediumPopMed),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 36,
                width: 96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFFEEEDEF),
                  border: Border.all(width: 1, color: Color(0XFFEEEDEF)),
                ),
                child: Center(child: Text("Rarely")),
              ),
              Container(
                height: 36,
                width: 132,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFFE6F3F4),
                  border: Border.all(width: 1, color: Color(0XFFEEEDEF)),
                ),
                child: Center(child: Text("Non-smoker")),
              ),
            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Container(
              height: 36,
              width: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0XFFEEEDEF),
                border: Border.all(width: 1, color: Color(0XFFEEEDEF)),
              ),
              child: Center(child: Text("Trying to quit")),
            ),
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
