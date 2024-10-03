import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/res/global.dart';

class AuthController extends ChangeNotifier {
  bool authIsLoginStatus = false;
  bool authIsSignStatus = false;
  bool loading = false;

  setAuthLoginStatus() {
    authIsLoginStatus = true;
    authIsSignStatus = false;
    notifyListeners();
  }

  setAuthSignStatus() {
    authIsLoginStatus = false;
    authIsSignStatus = true;
    notifyListeners();
  }

  setLoading(val) {
    loading = val;
    notifyListeners();
  }

  Future<void> signInUserAccount(context, String email, String password) async {
    try {
      // Create user account with email and password
      setLoading(true);
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User account created successfully
      print("Account Login successfully");
      print(userCredential.user!.uid);
      print("test");

      UserId = userCredential.user!.uid;

    final ref = FirebaseDatabase.instance.ref();
final snapshot = await ref.child('users/$UserId').get();
if (snapshot.exists) {
    print(snapshot.value);
} else {
    print('No data available.');
}

      Get.snackbar(
        "Success",
        "User account created successfully", // Display the error message
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
      // SignUp(context);
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
}
