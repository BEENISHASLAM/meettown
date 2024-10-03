import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meettown/res/shard_preferences.dart';
import '../../model/Search_user_location_model.dart';

class LocationController extends GetxController {
  var isLoading = false.obs;
  var userProfiles = <Data>[].obs;

  SharedPreference preference = SharedPreference();

  void setLoading(bool val) {
    isLoading.value = val;
  }

  // Fetch users by location
  Future<void> fetchUserByLocation() async {
    setLoading(true);
    final token = await preference.getToken();

    var headers = {
      'token': '$token', // Replace with your actual token
    };

    var request = http.Request('GET', Uri.parse('https://meet-town-3f191b8f46d2.herokuapp.com/api/user/location-by-users'));
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final UserProfile jsonResponse = UserProfile.fromJson(json.decode(responseData));

        // Check if the response status is true and data is not null
        if (jsonResponse.status == true && jsonResponse.data != null) {
          userProfiles.value = jsonResponse.data!; // Update the list of Data reactively
        } else {
          print("Data is null or status is false");
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setLoading(false);
    }
  }
}
