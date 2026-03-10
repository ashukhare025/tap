import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/map_controller.dart';

class MapView extends StatelessWidget {
  MapView({super.key});
  final MapController controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Indore Map'), centerTitle: true),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: controller.initialPosition,
          zoom: 12,
        ),
        // Only markers are reactive
        markers: controller.markers,
        onTap: (position) {
          String id = DateTime.now().millisecondsSinceEpoch.toString();
          controller.addMarker(position, id, "Marker $id");
        },
      ),
    );
  }
}
