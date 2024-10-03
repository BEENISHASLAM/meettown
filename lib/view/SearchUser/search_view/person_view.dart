import 'package:flutter/material.dart';
import 'package:meettown/res/components/post_cart.dart';

class PersonView extends StatelessWidget {
  const PersonView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return
          PostCart(name: 'Gab', distance: '300KM', gender: 'Male', image: 'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea', location: 'Paris,France', onCommentTap: (){}, onHeartTap: (){});
      },
    );
  }
}