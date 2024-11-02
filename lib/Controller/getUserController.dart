import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:meettown/Response/Response.dart';
import 'package:meettown/model/user_profile_model.dart';
import 'package:meettown/modelView/api_url/api_url.dart';
import 'package:meettown/res/shard_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:meettown/view/BottomNavbar/BottomNavbar.dart';

class UserProfileController extends GetxController {
  var isLoading = false.obs;
  var userProfiles = [].obs;
  var userProfilesFriend = [].obs;

  var sendRequestLoading = false.obs;

  RxList interests = [].obs;

  SharedPreference preference = SharedPreference();

  setLoading(val) {
    isLoading.value = val;
  }

  Future<void> sendRequest(String? id) async {
    var responseJson;
    try {
      sendRequestLoading.value = true;

      final token = await preference.getToken();
      var headers = {
        'token': '$token',
        'Content-Type': 'application/json',
      };

      var body = json.encode({
        "receiverId": "$id",
        "requestType": "follow",
      });

      final response = await http.post(
          Uri.parse(ApiUrl.baseUrl + "user/send-request"),
          body: body,
          headers: headers);

      responseJson = returnResponse(response);
      sendRequestLoading.value = false;
      Get.offAll(CustomNavbar());
    } catch (e) {
      sendRequestLoading.value = false;
      Get.back();
    }
    return responseJson;
  }

  Future<void> fetchUserProfileDetails(id) async {
    userProfiles.clear();
    setLoading(true);
    final token = await preference.getToken();

    var headers = {
      'token': '$token', // Replace with your actual token
    };

    var request = http.Request(
        'GET', Uri.parse('${ApiUrl.baseUrl}user/get-user-profile?id=${id}'));
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final UserProfileView jsonResponse =
            UserProfileView.fromJson(json.decode(responseData));
        log(responseData);

        // Check if the response status is true and data is not null
        if (jsonResponse.status == true && jsonResponse.data != null) {
          jsonResponse.data!;
          userProfiles.add(jsonResponse.data!);
          if (jsonResponse.data!.interests!.length > 0) {
            interests.value = jsonResponse.data!.interests
                .toString()
                .replaceAll('[', '')
                .replaceAll(']', '')
                .split(',')
                .map((s) => s.trim())
                .toList();
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

Future<void> fetchUserFriendDetails(String id) async {
  userProfilesFriend.clear();
  setLoading(true);
  final token = await preference.getToken();
  var responseJson;

  Map<String,String> headers = {
    'token': token.toString(), // Replace with your actual token
  };

  try {
    final response = await http.get(
      Uri.parse('${ApiUrl.baseUrl}user/get-user-profile?id=$id'),
      headers: headers,
    );

    if (response.statusCode == 200) {

       responseJson = returnResponse(response);
       var list =[];
    
         list.add(responseJson["data"]!);
        if (responseJson["data"]["interests"]!.isNotEmpty) {
          interests.value = responseJson.data!.interests
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              .split(',')
              .map((s) => s.trim())
              .toList();
        } else {
          interests.value = [];
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

