import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meettown/res/shard_preferences.dart';
import 'package:meettown/model/Serach_user_by_match_interest.dart'; // For JSON decoding

class MatchController extends GetxController {
  var userProfilesList = <dynamic>[].obs; // Observable list for user profiles
  var isLoading = false.obs; // Observable for loading state
  var errorMessage = ''.obs; // Observable for error messages

  SharedPreference preference = SharedPreference();

  @override
  void onInit() {
    fetchUserByMatchInterest(); // Fetch data when the controller is initialized
    super.onInit();
  }

  Future<void> fetchUserByMatchInterest() async {
    isLoading(true); // Set loading to true
    userProfilesList.clear(); // Clear the list before fetching new data

    final token = await preference.getToken();

    var headers = {
      'token': '$token',
    };

    var request = http.Request(
      'GET',
      Uri.parse('https://meet-town-3f191b8f46d2.herokuapp.com/api/user/get-my-send-request'),
    );
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);

        // Assuming GetUserByMatch is the model for parsing data
        final GetUserByMatch matchData = GetUserByMatch.fromJson(jsonResponse);

        // Update the observable list with the fetched data
        if (matchData.data != null) {
          userProfilesList.value = matchData.data!;
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
