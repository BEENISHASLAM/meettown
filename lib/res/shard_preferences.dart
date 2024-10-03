// ignore_for_file: body_might_complete_normally_nullable

import 'package:nb_utils/nb_utils.dart';

class SharedPreference {
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<String?> SetToken(val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', val);
  }
}
