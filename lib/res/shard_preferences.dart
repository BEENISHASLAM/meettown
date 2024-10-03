import 'package:nb_utils/nb_utils.dart';

class SharedPreference {

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}