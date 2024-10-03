import 'package:flutter/material.dart';
import 'package:meettown/res/components/location_carts.dart';
import 'package:meettown/view/profile_view/profile_view.dart';
import 'package:provider/provider.dart';

import '../../../../modelView/Filter/location_controller.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback to call the API after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locationController = Provider.of<LocationController>(context, listen: false);
      locationController.fetchUserByLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationController = Provider.of<LocationController>(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 170,
        crossAxisCount: 3,
      ),
      itemCount: locationController.userProfiles?.length ?? 0, // // Use actual userProfiles length
      itemBuilder: (BuildContext context, int index) {
        final userProfile = locationController.userProfiles![index];
        final user =  userProfile.user;
        final imgUrl = userProfile.profileImage?.file;
        final imgBaseUrl = 'https://res.cloudinary.com/dkfgfnbst/image/upload/';
        final url = imgBaseUrl+imgUrl!;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileView(name: "Name 27"), // Use actual user name
              ),
            );
          },
          child: LocationCart(
            userImage:
             url,
            //'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea',
            name: user?.firstName ?? 'No Name',
            distance: userProfile.distanceKm ??'300 KM',
            nationality:userProfile.nationality?? '00',
            level: user?.lastName ?? 'No Name',
            offline: user!.online!
          ),
        );
      },
    );
  }
}
