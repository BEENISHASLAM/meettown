import 'package:get/get.dart';
import 'package:meettown/model/login_model.dart'; // Import your LoginResponse model

class UserDataController extends GetxController {
  // Making _loginResponse reactive using Rxn<LoginResponse> (nullable)
  var loginResponse = Rxn<LoginResponse>();

  // Getter for loginResponse (not strictly needed but can be used for access)
  LoginResponse? get getLoginResponse => loginResponse.value;

  // Method to update loginResponse
  void setLoginResponse(LoginResponse response) {
    loginResponse.value = response;
  }
}
