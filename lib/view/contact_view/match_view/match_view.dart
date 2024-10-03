import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';

class MatchView extends StatelessWidget {
  const MatchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "The Just Post",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: appColors.textBlueColor),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                "No item found",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: appColors.textBlueColor),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                "The list is currently empty",
                style: TextStyle(fontSize: 18, color: appColors.textBlueColor),
              ),
            ),
    ],);
  }
}