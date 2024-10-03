import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/components/upcoming_own_trip.dart';

class OwnUpComingTrips extends StatelessWidget {
  const OwnUpComingTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return UpcomingOwnTrips(image: 'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea', flagImage: 'https://cdn.pixabay.com/photo/2017/03/14/21/00/american-flag-2144392_1280.png', endDate: '2024-04-03', location: 'city-country', startDate: '2023-04-03');
      },
    );
  }
}




// ignore: must_be_immutable
class IconsTextWidget extends StatelessWidget {
  String title;
  IconData icon;
  Color color;
   IconsTextWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: appColors.textPrimaryColor),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          icon,
          color: color,
          size: 30,
        ),
 
         
       
       
      ],
    );
  }
}
