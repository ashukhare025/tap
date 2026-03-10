import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  var markers = <Marker>{}.obs;

  final initialPosition = LatLng(22.7196, 75.8577);

  void addMarker(LatLng position, String id, String title) {
    final newMarker = Marker(
      markerId: MarkerId(id),
      position: position,
      infoWindow: InfoWindow(title: title),
    );
    markers.add(newMarker);
  }
}
