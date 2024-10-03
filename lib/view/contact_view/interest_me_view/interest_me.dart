import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meettown/res/components/contacts_my_likes.dart';
import 'package:meettown/res/components/custom_button.dart';

class InterestedMe extends StatelessWidget {
  const InterestedMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ContactMyLikes(
                name: 'Gab',
                gender: 'Male',
                image:
                    'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea',
                location: 'Paris,France',
                onCommentTap: () {},
                onHeartTap: () {});
          },
        ),
        //  Image.network(
        //       'https://img.freepik.com/free-photo/girl-sitting-near-window-looking-her-smartphone_1157-1533.jpg?w=360&t=st=1711728877~exp=1711729477~hmac=9d48c6334c1993d974d0b2f1dbf1c348c07a8cd73edd7f71e9cc69881942de6b',
        //       fit: BoxFit.cover,
        //       width: MediaQuery.of(context).size.width,
        //       height: MediaQuery.of(context).size.height,
        //     ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Please Update your Account to unlock premium features',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(title: 'Upgrade Now', onTap: () {})
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
