import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';

// ignore: must_be_immutable
class FilterButton extends StatelessWidget {
  String name;
  Function()? onTap;
   FilterButton({
    super.key,
    required this.name,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          padding: EdgeInsets.all(12),
          // height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: appColors.textBlueColor,
              )),
          child: Center(
              child: Text(
            name,
            style: TextStyle(color: appColors.textBlueColor),
          ))),
    );
  }
}
