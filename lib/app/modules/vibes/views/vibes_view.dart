import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vibes_controller.dart';

class VibesView extends GetView<VibesController> {
  const VibesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VibesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VibesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
