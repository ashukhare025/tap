import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Model/chat_model.dart';
import '../../../../Model/message_model.dart';

class ChatController extends GetxController {
  // User List
  var chatList = <ChatUser>[
    ChatUser(
      name: "Alex Linderson",
      lastMessage: "How are you today?",
      time: "2 min ago",
      unreadCount: 3,
      id: '1',
      image:
          'https://www.google.com/imgres?q=person&imgurl=https%3A%2F%2Fwww.wilsoncenter.org%2Fsites%2Fdefault%2Ffiles%2Fmedia%2Fimages%2Fperson%2Fjames-person-1.jpg&imgrefurl=https%3A%2F%2Fwww.wilsoncenter.org%2Fperson%2Fjames-person&docid=dxLGJhHzJVuEnM&tbnid=kA_Qr7hQY-WaFM&vet=12ahUKEwiZw5vT2dOSAxV2dvUHHd5hEzcQnPAOegQIGRAB..i&w=2880&h=3840&hcb=2&ved=2ahUKEwiZw5vT2dOSAxV2dvUHHd5hEzcQnPAOegQIGRAB',
    ),
    ChatUser(
      name: "Team Align",
      lastMessage: "Don’t miss the meeting",
      time: "5 min ago",
      unreadCount: 4,
      id: '2',
      image:
          'https://www.google.com/imgres?q=person&imgurl=https%3A%2F%2Fcdn2.psychologytoday.com%2Fassets%2Fstyles%2Fmanual_crop_4_3_1200x900%2Fpublic%2Ffield_blog_entry_images%2F2018-09%2Fshutterstock_648907024.jpg%3Fitok%3DeaVcXTz5&imgrefurl=https%3A%2F%2Fwww.psychologytoday.com%2Fus%2Fblog%2Fask-the-therapist%2F201809%2Fwhy-would-people-dislike-a-nice-person&docid=QZktTcDTRgrrDM&tbnid=omUl2f11QcY6DM&vet=12ahUKEwiZw5vT2dOSAxV2dvUHHd5hEzcQnPAOegQIFBAB..i&w=1200&h=900&hcb=2&ved=2ahUKEwiZw5vT2dOSAxV2dvUHHd5hEzcQnPAOegQIFBAB',
    ),
  ].obs;

  void deleteChat(int index) {
    chatList.removeAt(index);
  }

  void archiveChat(int index) {
    chatList.removeAt(index);
  }

  // Message
  var messages = <ChatMessage>[
    ChatMessage(message: "Hello! Jhon abraham", isMe: true, time: "09:25 AM"),
    ChatMessage(
      message: "Hello ! Nazrul How are you?",
      isMe: false,
      time: "09:25 AM",
    ),
    ChatMessage(
      message: "You did your job well!",
      isMe: true,
      time: "09:25 AM",
    ),
    ChatMessage(
      message: "Have a great working week!!",
      isMe: false,
      time: "09:25 AM",
    ),
    ChatMessage(message: "Hope you like it", isMe: false, time: "09:25 AM"),
    ChatMessage(message: "voice", isMe: true, time: "09:25 AM", isVoice: true),
  ].obs;

  TextEditingController msgController = TextEditingController();

  void sendMessage() {
    if (msgController.text.trim().isEmpty) return;

    messages.add(
      ChatMessage(
        message: msgController.text,
        isMe: true,
        time: TimeOfDay.now().format(Get.context!),
      ),
    );

    msgController.clear();
  }
}
