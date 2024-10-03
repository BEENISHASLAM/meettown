import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/components/custom_button.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

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
                'No Connection available',
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
