import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/social_controller.dart';

class SocialView extends GetView<SocialController> {
  const SocialView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SocialView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SocialView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
