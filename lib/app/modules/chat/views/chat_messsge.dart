import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/styles.dart';
import '../controllers/chat_controller.dart';

class ChatDetailView extends StatelessWidget {
  ChatDetailView({super.key});

  final controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      // AppBar
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/image/arjit.jpg"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jhon Abraham", style: CarosMed),
                Text("Active now", style: StdR),
              ],
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // Today label
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0XFFF8FBFA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("Today", style: CarosMedi),
            ),

            // Messages
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.all(12),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final msg = controller.messages[index];

                    if (msg.isMe) {
                      return _myMessage(msg);
                    } else {
                      return _otherMessage(msg);
                    }
                  },
                ),
              ),
            ),

            _messageInput(),
          ],
        ),
      ),
    );
  }

  // My message (right)
  Widget _myMessage(msg) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: 260),
        decoration: BoxDecoration(
          color: Color(0xFF4A0D67),
          borderRadius: BorderRadius.circular(16),
        ),
        child: msg.isVoice
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_arrow, color: Colors.white),
                  SizedBox(width: 6),
                  Text("00:16", style: StdRe),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(msg.message, style: TextStyle(color: Colors.white)),
                  SizedBox(height: 4),
                  Text(
                    msg.time,
                    style: TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                ],
              ),
      ),
    );
  }

  // Other message (left)
  Widget _otherMessage(msg) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage("assets/image/arjit.jpg"),
        ),
        SizedBox(width: 8),
        Container(
          margin: EdgeInsets.symmetric(vertical: 6),
          padding: EdgeInsets.all(12),
          constraints: BoxConstraints(maxWidth: 240),
          decoration: BoxDecoration(
            color: Color(0XFFF2F2F2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(msg.message, style: BookRegBook),
              SizedBox(height: 4),
              Text(msg.time, style: StdBookR),
            ],
          ),
        ),
      ],
    );
  }

  // Bottom Input
  Widget _messageInput() {
    final controller = Get.find<ChatController>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.white,
      child: Row(
        children: [
          Icon(Icons.attach_file, color: Color(0XFF000E08), size: 24),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller.msgController,
              decoration: InputDecoration(
                hintText: "Write your message",
                hintStyle: StdR,
                filled: true,
                fillColor: Color(0xFFF3F6F6),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                suffixIcon: Icon(
                  Icons.emoji_emotions_outlined,
                  color: Color(0XFFF4C534),
                  size: 17.53,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            child: Icon(
              Icons.camera_alt_outlined,
              color: Color(0XFF000E08),
              size: 24,
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: controller.sendMessage,
            child: Icon(Icons.mic_none, color: Color(0XFF000E08), size: 24),
          ),
        ],
      ),
    );
  }
}
