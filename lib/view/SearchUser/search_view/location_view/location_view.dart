import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/res/components/location_carts.dart';
import 'package:meettown/view/SearchUser/search_view/location_view/user_profile_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../modelView/Filter/location_controller.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  var locationController = Get.put(LocationController());
  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback to call the API after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      locationController.fetchUserByLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return locationController.isLoading.value
          ? Skeletonizer(
              enabled: locationController.isLoading.value,
              effect: ShimmerEffect(
                highlightColor: Colors.white,
                baseColor: Color.fromARGB(255, 178, 178, 178),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 170,
                  crossAxisCount: 3,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return LocationCartLoading(
                      userImage:
                          'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea',
                      name: 'No Name',
                      distance: '300 KM',
                      nationality: '00',
                      level: 'No Name',
                      offline: true);
                },
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 170,
                crossAxisCount: 3,
              ),
              itemCount: locationController.userProfiles?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final userProfile = locationController.userProfiles![index];
                final user = userProfile.user;
                final imgUrl = userProfile.profileImage?.file;
                final imgBaseUrl = 'https://res.cloudinary.com/dkfgfnbst/image/upload/';
                final url = imgBaseUrl + imgUrl!;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserProfileView(profile: userProfile), // Use actual user name
                      ),
                    );
                  },
                  child: LocationCart(
                      userImage: url,
                      //'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea',
                      name: user?.firstName ?? 'No Name',
                      distance: userProfile.distanceKm ?? '300 KM',
                      nationality: userProfile.nationality ?? '00',
                      level: user?.lastName ?? 'No Name',
                      offline: user!.online!),
                );
              },
            );
    });
  }
}
