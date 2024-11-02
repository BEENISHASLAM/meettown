import 'package:flutter/material.dart';
import 'package:get/get.dart';

var UserId = "";
var UserName = "";
var image ="";



SnackbarController Message(String title, String message) {
  print("Showing snackbar: $title - $message");
  return Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
  );
}
