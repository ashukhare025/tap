import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/chat/controllers/chat_controller.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/map/views/map_view.dart';
import '../modules/social/views/social_view.dart';
import '../modules/vibes/views/vibes_view.dart';
import '../modules/home/controllers/home_controller.dart';
import 'custom_bottom.dart';
import '../modules/home/views/home_view.dart';

class BottomNavView extends StatelessWidget {
  BottomNavView({super.key});

  final controller = Get.put(HomeController());
  final chatController = Get.put(ChatController());

  final pages = [SocialView(), ChatView(), HomeView(), VibesView(), MapView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
