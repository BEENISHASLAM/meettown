import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meettown/res/shard_preferences.dart';
import '../../model/Serach_user_by_match_interest.dart';

class SearchUserByInterestController extends ChangeNotifier {
  bool loading = false;
  SharedPreference preference = SharedPreference();
  List<Data>? userProfilesList = [];// Keep this as List<Data>

  void setLoading(bool val) {
    loading = val;
    notifyListeners();
  }

  Future<void> fetchUserByMatchInterest() async {
    setLoading(true);
    final token = await preference.getToken();
    var headers = {
      'token': '$token'
    };

    var request = http.Request('GET', Uri.parse('https://meet-town-3f191b8f46d2.herokuapp.com/api/user/match-interset-by-users'));
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final GetUserByMatch jsonResponse = GetUserByMatch.fromJson(json.decode(responseData));
        print(responseData);
        userProfilesList = jsonResponse.data;
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




