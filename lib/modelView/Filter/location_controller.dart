import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meettown/res/shard_preferences.dart';
import '../../model/Search_user_location_model.dart';

class LocationController extends ChangeNotifier {
  bool loading = false;
  SharedPreference preference = SharedPreference();
  List<Data>? userProfiles = []; // Keep this as List<Data>

  void setLoading(bool val) {
    loading = val;
    notifyListeners();
  }

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
        print("beensh");
        final responseData = await response.stream.bytesToString();
        final UserProfile jsonResponse = UserProfile.fromJson(json.decode(responseData));

        // Check if the response status is true and data is not null
        if (jsonResponse.status == true && jsonResponse.data != null) {
          print("/heelo");
          userProfiles = jsonResponse.data; // Assign the list of Data
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
