import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class HomeStateController extends GetxController {
  /// Categories
  var categories = ["Chill", "Party", "Music", "Lounge"];
  var selectedIndex = 0.obs;

  void selectCategory(int index) {
    selectedIndex.value = index;
  }

  /// Map Controller (flutter_map)
  final MapController mapController = MapController();

  /// Initial location (Indore)
  final LatLng initialPosition = LatLng(22.7196, 75.8577);

  /// Markers list
  var markers = <Marker>[].obs;

  @override
  void onInit() {
    super.onInit();
    addMarkers();
  }

  void addMarkers() {
    markers.addAll([
      Marker(
        point: initialPosition,
        width: 40,
        height: 40,
        child: const Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
      Marker(
        point: LatLng(22.7250, 75.8650),
        width: 40,
        height: 40,
        child: const Icon(Icons.location_on, color: Colors.blue, size: 40),
      ),
    ]);
  }

  /// Move camera
  void moveToLocation(LatLng location) {
    mapController.move(location, 15);
  }
}
