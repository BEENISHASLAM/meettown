import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modelView/Auth/password_visibility_controller.dart';

// ignore: must_be_immutable
class CustomTextInputField extends StatelessWidget {
  String title;
  TextEditingController controller;
  TextInputType? keyboard = TextInputType.name;

  CustomTextInputField(
      {super.key,
      required this.title,
      required this.controller,
      this.keyboard});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        hintText: title,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        // You can add more complex validation logic here
        return null; // Return null if the input is valid
      },
    );
  }
}

// ignore: must_be_immutable
class CustomTextInputPasswordField1 extends StatefulWidget {
  String title;
  TextEditingController controller;

  CustomTextInputPasswordField1({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  State<CustomTextInputPasswordField1> createState() => _CustomTextInputPasswordFieldState();
}

class _CustomTextInputPasswordFieldState extends State<CustomTextInputPasswordField1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordVisibilityModel>(
      builder: (context, passwordVisibilityModel, child) => TextFormField(
        obscureText: passwordVisibilityModel.isPasswordVisible,
        controller: widget.controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: widget.title,
          hintStyle: TextStyle(color: Colors.white),
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisibilityModel.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () {
              print(passwordVisibilityModel.isPasswordVisible);
              passwordVisibilityModel.togglePasswordVisibility();
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextInputPasswordFieldForSignUp extends StatefulWidget {
  String title;
  TextEditingController controller;

  CustomTextInputPasswordFieldForSignUp({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  State<CustomTextInputPasswordFieldForSignUp> createState() =>
      _CustomTextInputPasswordFieldForSignUpState();
}

class _CustomTextInputPasswordFieldForSignUpState
    extends State<CustomTextInputPasswordFieldForSignUp> {
  var value = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordVisibilityModel>(
      builder: (context, passwordVisibilityModel, child) => TextFormField(
        obscureText: value,
        controller: widget.controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () {
                value = !value;
                setState(() {});
              },
              child: Icon(
                Icons.remove_red_eye,
                color: Colors.white,
              )),
          hintText: widget.title,
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
