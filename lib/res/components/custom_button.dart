import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';

// ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {
  String title;
  Color foregroundColor, bgColor, selectedFgButtonColor;
  final VoidCallback onpress;
  double? width = 80, heigth = 40;

  CustomButtonWidget(
      {super.key,
      required this.title,
      required this.foregroundColor,
      required this.bgColor,
      required this.selectedFgButtonColor,
      required this.onpress,
      this.heigth,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      child: ElevatedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              return foregroundColor; // Black color otherwise
            }),
            backgroundColor: MaterialStateProperty.all<Color>(
                bgColor), // Set your desired background color
          ),
          onPressed: () {
            onpress();
          },
          child: Text(title)),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
 final Function()? onTap;
  const CustomButton({
    super.key,required this.title,required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        decoration: BoxDecoration(
            color: appColors.textBlueColor,
            borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}

