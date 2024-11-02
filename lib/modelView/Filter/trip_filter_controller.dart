import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../res/shard_preferences.dart';

class ContactModel extends ChangeNotifier {
  final SharedPreference prefs = SharedPreference();
  TextEditingController location = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  // late DateTime startDate;
  // late DateTime endDate;
  String travelMode = 'air';
  String youStay = 'other';
  String travelFor = 'business';

  void setTravelMode(String val) {
    travelMode = val;
    notifyListeners();
  }
  void setYouStay(String val) {
    youStay = val;
    notifyListeners();
  }
  void setTravelFor(String val) {
    travelFor = val;
    notifyListeners();
  }

  // Add other properties and methods as needed


Future<void> addTrip() async {
  final token = await prefs.getToken();
  var headers = {
    'token': '$token'
  };
  var request = http.MultipartRequest('POST', Uri.parse('https://meet-town-3f191b8f46d2.herokuapp.com/api/trip/add'));
  request.fields.addAll({
    'location': location.text,
    'startDate': startDate.text,
    'endDate': endDate.text,
    'travelMode': travelMode,
    'stayType': youStay,
    'tripType': travelFor
  });
  request.files.add(await http.MultipartFile.fromPath('tripMedia', 'https://cdn.pixabay.com/photo/2023/07/04/19/43/man-8106958_1280.png'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print("api hit");
  print(await response.stream.bytesToString());
  }
  else {
  print(response.reasonPhrase);
  }

}
}
