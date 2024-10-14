import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/Serach_user_by_match_interest.dart';
import '../../res/shard_preferences.dart';

class SearchUserByInterestController extends GetxController {
  final SharedPreference preference = SharedPreference();

  // Reactive variables
  var loading = false.obs;
  var userProfilesList = <Data>[].obs; // Reactive List

  // Function to set loading state
  void setLoading(bool val) {
    loading.value = val;
  }

  // Function to fetch users by matching interest
  Future<void> fetchUserByMatchInterest() async {
    setLoading(true);
    userProfilesList.clear();
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
