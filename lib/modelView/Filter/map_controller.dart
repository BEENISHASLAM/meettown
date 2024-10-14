// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:meettown/modelView/Filter/createAvatarMarker.dart';
import 'package:meettown/modelView/Filter/locationServices.dart';
import 'package:meettown/modelView/api_url/api_url.dart';
import 'package:meettown/view/SearchUser/search_view/location_view/user_profile_view.dart';
import '../../model/Serach_user_by_match_interest.dart';
import '../../res/shard_preferences.dart';

class UserMapController extends GetxController {
  final SharedPreference preference = SharedPreference();

  // Reactive variables
  var loading = false.obs;
  var userProfilesList = <Data>[].obs; // Reactive List
  var currentLocaion = LatLng(37.7749, -122.4194).obs;
  Position? _currentPosition;
  var markers = <Marker>[].obs;

  // Function to set loading state
  void setLoading(bool val) {
    loading.value = val;
  }

  // Function to get current location
  Future<void> getLocation() async {
    try {
      final locationService = LocationService();
      final position = await locationService.getCurrentLocation();

      _currentPosition = position;
      currentLocaion.value = LatLng(position.latitude, position.longitude);
    } catch (e) {
      print('Error: $e');
    }
  }

  // Function to fetch users by matching interest
  Future<void> fetchUserByMatchInterest() async {
    setLoading(true);
    userProfilesList.clear();
    markers.clear();
    getLocation();
    final token = await preference.getToken();
    var headers = {
      'token': '$token',
    };

    var request = http.Request(
      'GET',
      Uri.parse('https://meet-town-3f191b8f46d2.herokuapp.com/api/user/match-interset-by-users'),
    );
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final GetUserByMatch jsonResponse = GetUserByMatch.fromJson(json.decode(responseData));
        print(responseData);
        userProfilesList.value = jsonResponse.data!; // Update reactive list
        setLoading(false);
        for (var user in userProfilesList.value) {
          var loc = user.userData!.location!.coordinates!;
          final BitmapDescriptor markerIcon =
              await MarkerHelper().createCircularAvatarMarkerFromUrl(ApiUrl.imageUrl + user.userData!.profileImage!.file!); // Load from URL
          if (loc[0] != null && loc[1] != null) {
            markers.add(
              Marker(
                markerId: MarkerId(user.userData!.sId!), // Use a unique ID for each marker
                position: LatLng(loc[1], loc[0]), // User's location
                icon: markerIcon,
                onTap: () {
                  Get.to(
                    UserProfileView(profile: user.userData!),
                  );
                },
                infoWindow: InfoWindow(
                  title: user.userData!.authId!.firstName, // Display the user's name on the marker
                  // snippet: 'User Interest: ${user.interest}', // Optional info
                ),
              ),
            );
          }
        }
      } else {
        print(response.reasonPhrase);
      }
      print(markers);
    } catch (e) {
      print("Error: $e");
    } finally {
      setLoading(false);
    }
  }
}
