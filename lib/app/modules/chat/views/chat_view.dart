import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../../../../widget/stody_widget.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3C006B),
      appBar: AppBar(
        backgroundColor: Color(0XFF3C006B),
        elevation: 0,
        title: Text("Home", style: MediumPopiMedi),
        centerTitle: true,

        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color.lerp(Color(0XFF3C006B), Colors.white, 0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(Icons.search, color: Colors.white, size: 24),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                print("Profile clicked");
              },
              child: CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=3",
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(children: [StatusSection()]),
    );
  }
}
