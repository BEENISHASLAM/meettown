
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meettown/Response/Response.dart';
import 'dart:convert';
import 'package:meettown/res/shard_preferences.dart';

import '../modelView/api_url/api_url.dart'; // For JSON decoding

class MatchController extends GetxController {
  var userProfilesSendList = [].obs; // Observable list for user profiles
  var userProfilesRecieveList = [].obs; // Observable list for user profiles
  var userFriendsList =[].obs;

  var isLoading = false.obs; // Observable for loading state
  var errorMessage = ''.obs; // Observable for error messages

  var isLoadingBtn = false.obs;



  SharedPreference preference = SharedPreference();

  @override
  void onInit() {
    // fetchUserByMatchInterest(); // Fetch data when the controller is initialized
    super.onInit();
  }

  Future<void> GetBySendList() async {
    isLoading(true); // Set loading to true
    userProfilesSendList.clear(); // Clear the list before fetching new data

    final token = await preference.getToken();

    var headers = {
      'token': '$token',
    };

    var request = http.Request(
      'GET',
      Uri.parse(
          'https://meet-town-3f191b8f46d2.herokuapp.com/api/user/get-my-send-request'),
    );
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);

        // Assuming GetUserByMatch is the model for parsing data
        // final GetUserByMatch matchData = GetUserByMatch.fromJson(jsonResponse);

        // Update the observable list with the fetched data
        if (jsonResponse["status"] == true) {
          userProfilesSendList.value = jsonResponse["data"];
          isLoading(false);
        }
      } else {
        errorMessage.value = 'Error: ${response.reasonPhrase}';
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      errorMessage.value = 'Error: $e';
    }
  }

  Future<void> AcceptRequest(context, String? id, index) async {
    var responseJson;
    try {
      isLoadingBtn.value = true;
      final token = await preference.getToken();
      var headers = {
        'token': '$token',
        'Content-Type': 'application/json',
      };

      var body = json.encode({"status": "accepted"});

      final response = await http.post(
          Uri.parse(ApiUrl.baseUrl + "user/update-request?id=${id}"),
          body: body,
          headers: headers);

      responseJson = returnResponse(response);

      var profileData = userProfilesRecieveList;

      profileData.removeAt(index);
      update();
      isLoadingBtn.value = false;
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      // Hide loading dialog
    }
    return responseJson;
  }


  Future<void> GetFriendList() async {
    isLoading(true); // Set loading to true
    userFriendsList.clear(); // Clear the list before fetching new data

    final token = await preference.getToken();

    var headers = {
      'token': '$token',
    };

    var request = http.Request(
      'GET',
      Uri.parse(
         ApiUrl.baseUrl + 'user/get-login-user-profile'),
    );
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);

        // Assuming GetUserByMatch is the model for parsing data
        // final GetUserByMatch matchData = GetUserByMatch.fromJson(jsonResponse);

        // Update the observable list with the fetched data
        if (jsonResponse["status"] == true) {
          userFriendsList.value = jsonResponse["data"]["friends"];
        }
      } else {
        errorMessage.value = 'Error: ${response.reasonPhrase}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false); // Set loading to false after the fetch
    }
  }

  Future<void> GetByRecieveList() async {
    userProfilesRecieveList.clear();
    isLoading(true); // Set loading to true
     // Clear the list before fetching new data

    final token = await preference.getToken();

    var headers = {
      'token': '$token',
    };

    var request = http.Request(
      'GET',
      Uri.parse(
          'https://meet-town-3f191b8f46d2.herokuapp.com/api/user/get-my-recieved-request'),
    );
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);

        // Assuming GetUserByMatch is the model for parsing data
        // final GetUserByMatch matchData = GetUserByMatch.fromJson(jsonResponse);

        // Update the observable list with the fetched data
        if (jsonResponse["status"] == true) {
          userProfilesRecieveList.value = jsonResponse["data"];
        }
      } else {
        errorMessage.value = 'Error: ${response.reasonPhrase}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false); // Set loading to false after the fetch
    }
  }
}
