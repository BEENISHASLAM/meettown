import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/get_filter_user_model.dart';
import '../../res/shard_preferences.dart';

class CardSwipeController extends GetxController {
  final SharedPreference prefs = SharedPreference();

  // Reactive variables
  var loading = false.obs;
  var userProfilesList = <Data>[].obs;

  // Function to set loading state
  void setLoading(bool val) {
    loading.value = val;
  }

  // Function to get filtered users
  Future<void> getFilterUser() async {
    userProfilesList.clear();

    setLoading(true);
    final token = await prefs.getToken();
    var headers = {
      'token': '$token',
    };
    var request = http.Request(
      'GET',
      Uri.parse('https://meet-town-3f191b8f46d2.herokuapp.com/api/user/filtered-users'),
    );

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final GetFilterUser jsonResponse = GetFilterUser.fromJson(json.decode(responseData));
        print(responseData);
        userProfilesList.value = jsonResponse.data!;
        print(userProfilesList.length);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setLoading(false);
    }
  }

  // Function to send request
  Future<void> sendRequest(String? id) async {
    final token = await prefs.getToken();
    var headers = {
      'token': '$token',
      'Content-Type': 'application/json',
    };
    var request = http.Request(
      'POST',
      Uri.parse('https://meet-town-3f191b8f46d2.herokuapp.com/api/user/send-request'),
    );

    request.body = json.encode({
      "receiverId": "$id",
      "requestType": "follow",
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("hello");
    } else {
      print(response.reasonPhrase);
    }
  }
}
