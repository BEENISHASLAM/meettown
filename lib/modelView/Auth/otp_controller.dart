import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;

import '../../view/Auth/completed_profile.dart';

class OTpController extends ChangeNotifier {

  List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());
  String getOtp() {
    return otpControllers.map((controller) => controller.text).join('');
  }
  var loading = false;
  setLoading(val) {
    loading = val;
    notifyListeners();
  }
  Future<void> verifyOtp(BuildContext context) async {
    print("start");
    setLoading(true);
   final otp = getOtp();
    if (otp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter the OTP')),
      );
      return;
    }

    final token = await _getToken();

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Token not found. Please log in again.')),
      );
      return;
    }

    final url = Uri.parse('https://meet-town-3f191b8f46d2.herokuapp.com/api/otp/verify-otp');
    print("Request URL: $url");

    final requestPayload = {
      'otp': otp,
    };

    try {
      print(" api start");
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'token':  token,
        },
        body: jsonEncode(requestPayload),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP verification successful')),
        );
        setLoading(false);
        SignUp(context);

      } else {
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to verify OTP')),
        );
      }
    } catch (error) {
      setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('API call failed: $error')),
      );
    }
    setLoading(false);
  }

  Future<String?> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
  void SignUp(BuildContext context) {
    setLoading(false);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CompleteProfileView()));
  }
}
