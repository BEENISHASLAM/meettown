import 'package:flutter/material.dart';

import '../model/login_model.dart';

class UserDataProvider extends ChangeNotifier {
  LoginResponse? _loginResponse;

  LoginResponse? get loginResponse => _loginResponse;

  void setLoginResponse(LoginResponse response) {
    _loginResponse = response;
    notifyListeners();
  }
}
