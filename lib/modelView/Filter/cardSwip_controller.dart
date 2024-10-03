import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/get_filter_user_model.dart';
import '../../res/shard_preferences.dart';



class CardSwipeController extends ChangeNotifier {
  final SharedPreference prefs = SharedPreference();
  bool loading = false;
  List<Data>? userProfilesList = [];

  setLoading(val) {
    loading = val;
    notifyListeners();
  }
  Future<void>getFilterUser() async {
    setLoading(true);
    final token = await prefs.getToken();
    var headers = {
      'token': '$token',
    };
    var request = http.Request('GET', Uri.parse('https://meet-town-3f191b8f46d2.herokuapp.com/api/user/filtered-users'));

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final GetFilterUser jsonResponse = GetFilterUser.fromJson(json.decode(responseData));
        print(responseData);
        userProfilesList = jsonResponse.data!;
        print(userProfilesList!.length);
      }
    else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("Error: $e");
      setLoading(false);
    }
    setLoading(false);
  }
  Future<void> sendRequest(String? id)async{
    final token = await prefs.getToken();
    var headers = {
      'token': '$token',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://meet-town-3f191b8f46d2.herokuapp.com/api/user/send-request'));
    request.body = json.encode({
      "receiverId": "$id",
      "requestType": "follow"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("hello");
    }
    else {
      print(response.reasonPhrase);
    }

  }

}
