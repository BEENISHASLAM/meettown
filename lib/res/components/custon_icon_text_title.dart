import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconText extends StatelessWidget {
  String title;
  IconData icon;
  Color iconColor, textColor;
  CustomIconText({super.key, required this.icon, required this.title,required this.iconColor,required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Icon(
            icon,
            size: 15,
            color: iconColor,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold,color: textColor),
        )
      ],
    );
  }
}
