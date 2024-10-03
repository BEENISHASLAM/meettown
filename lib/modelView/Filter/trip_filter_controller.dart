import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactModel extends ChangeNotifier {
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
}
