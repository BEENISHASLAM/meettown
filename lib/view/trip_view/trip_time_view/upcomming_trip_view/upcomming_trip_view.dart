import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/components/custom_button.dart';

class UpCommingTrip extends StatelessWidget {
  const UpCommingTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'No Travelors Found',
                style: TextStyle(
                    color: appColors.textBlueColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              CustomButton(title: 'Refresh',onTap: (){},)
            ],
          )
        ],
      ),
    );
  }
}