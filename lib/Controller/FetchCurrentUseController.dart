import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:meettown/model/user_profile_model.dart';
import 'package:meettown/modelView/api_url/api_url.dart';
import 'package:meettown/res/shard_preferences.dart';
import 'package:http/http.dart' as http;

class CurrentUserProfileController extends GetxController {
  var isLoading = false.obs;
  var userProfiles = [].obs;

  RxList interests = [].obs;

  SharedPreference preference = SharedPreference();

  setLoading(val) {
    isLoading.value = val;
  }

  Future<void> fetchCurrentUserProfileDetails() async {
    userProfiles.clear();
    setLoading(true);
    final token = await preference.getToken();

    var headers = {
      'token': '$token', // Replace with your actual token
    };

    var request = http.Request('GET', Uri.parse('${ApiUrl.baseUrl}user/get-login-user-profile'));
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final UserProfileView jsonResponse = UserProfileView.fromJson(json.decode(responseData));
        log(responseData);

        // Check if the response status is true and data is not null
        if (jsonResponse.status == true && jsonResponse.data != null) {
          jsonResponse.data!;
          userProfiles.add(jsonResponse.data!);
          if (jsonResponse.data!.interests!.length > 0) {
            interests.value =
                jsonResponse.data!.interests.toString().replaceAll('[', '').replaceAll(']', '').split(',').map((s) => s.trim()).toList();
          } else {
            interests.value = [];
          }
          // userProfiles.value = jsonResponse.data!.data; // Update the list of Data reactively
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
