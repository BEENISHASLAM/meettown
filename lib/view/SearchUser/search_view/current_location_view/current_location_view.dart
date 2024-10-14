import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../modelView/Filter/map_controller.dart';

class CurrentLocationView extends StatefulWidget {
  const CurrentLocationView({super.key});

  @override
  State<CurrentLocationView> createState() => _CurrentLocationViewState();
}

class _CurrentLocationViewState extends State<CurrentLocationView> {
  final controller = Get.put(UserMapController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.fetchUserByMatchInterest();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.loading.value
          ? Skeletonizer(
              enabled: controller.loading.value,
              effect: ShimmerEffect(
                highlightColor: Colors.white,
                baseColor: Color.fromARGB(255, 178, 178, 178),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: MediaQuery.of(context).size.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://www.shutterstock.com/image-photo/perfect-match-smiling-arab-man-260nw-2253158921.jpg",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Text('Image not available'));
                    },
                  ),
                ),
              ),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: controller.currentLocaion.value,
                zoom: 12,
              ),
              markers: Set<Marker>.of(controller.markers),
              mapType: MapType.normal,
              // onMapCreated: (GoogleMapController controller) {
              //   // You can manipulate the map controller here
              // },
            );
    });
  }
}
