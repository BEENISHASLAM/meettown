import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/modelView/api_url/api_url.dart';
import 'package:meettown/res/global.dart';
import 'package:meettown/view/Auth/completed_profile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meettown/view/Auth/otp_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../model/register_model.dart';

class SignUpController extends ChangeNotifier {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController MobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confrimPassword = TextEditingController();
  String? selectedGenderValue;
  DateTime? selectDate;
  bool dateIsEmpty = true;

  var loading = false;

  setLoading(val) {
    loading = val;
    notifyListeners();
  }

  void SelectedGenderValue(String newValue) {
    selectedGenderValue = newValue;
    notifyListeners();
  }

  void SelectedDateValue(newValue) {
    selectDate = newValue;
    dateIsEmpty = false;
    notifyListeners();
  }

  Future<void> createUserAccount(context, String email, String password) async {
    try {
      // Create user account with email and password
      setLoading(true);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User account created successfully
      print('User account created successfully');
      DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference();
      UserId = userCredential.user!.uid;

      var newUserRef = databaseReference.child('users').child(UserId);
      newUserRef.set({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "phoneNo": MobileNumber.text,
        "gender": selectedGenderValue,
        "dob": selectDate!.toString(),
        "password": password,
        "email": email,
        "userId": userCredential.user!.uid
      });

      Get.snackbar(
        "Success",
        "User account created successfully", // Display the error message
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
      SignUp(context);
    } on FirebaseAuthException catch (e) {
      setLoading(false);

      // An error occurred while creating the user account
      Get.snackbar(
        "Error",
        e.message!, // Display the error message
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
      // You can handle different error scenarios here
    }
  }

  void SignUp(BuildContext context) {
    setLoading(false);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CompleteProfileView()));
  }






  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }








  Future<void> registerUser(BuildContext context) async {
    final firstName1= firstName.text;
    final lastName1 = lastName.text;
    final email1 = email.text;
    final password1 = password.text;
    // // final age = selectDate!.toString();
    // int year = selectDate!.year;


    final requestPayload = {
      'firstName': firstName1,
      'lastName': lastName1,
      'email': email1,
      'password': password1,
    };

    final url = Uri.parse('${ApiUrl.baseUrl}/auth/register'); // Replace with your API endpoint

    try {
      setLoading(true);
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestPayload),

      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final token = responseData['data']['token'];
        await saveToken(token);
        print(token);
        Get.snackbar(
          "Success",
          "User registered successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
        );

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OtpView()));
      } else {
        throw Exception('Failed to register user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      Get.snackbar(
        "Error",
        "Failed to register user: $error",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
      print(error);
    } finally {
      setLoading(false);
    }
  }
}






