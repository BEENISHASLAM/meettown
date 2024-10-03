import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationView extends StatelessWidget {
  const CurrentLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return   GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194),
          zoom: 12,
        ),
        mapType: MapType.normal,
        // onMapCreated: (GoogleMapController controller) {
        //   // You can manipulate the map controller here
        // },
      );
  }
}