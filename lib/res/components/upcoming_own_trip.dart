import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meettown/res/components/custon_icon_text_title.dart';
import 'package:meettown/view/profile_view/photo_view/photo_view.dart';

// ignore: must_be_immutable
class UpcomingOwnTrips extends StatelessWidget {
  String image, location, flagImage, startDate, endDate;
   UpcomingOwnTrips({super.key,required this.image,required this.flagImage,required this.endDate,required this.location,required this.startDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                image,
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image(
                image: imageProvider,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            placeholder: (context, url) => Container(
              width: double.infinity,
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) => Container(
              width: double.infinity,
              height: 200,
              child: Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          flagImage,
                                      imageBuilder: (context, imageProvider) =>
                                          Image(
                                        image: imageProvider,
                                        width: 30,
                                      ),
                                      placeholder: (context, url) =>
                                          CircleAvatar(
                                        radius: 10,
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          CircleAvatar(
                                        radius: 10,
                                        child: Center(
                                          child: Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      location,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.mapLocation,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CustomIconText(
                              icon: Icons.car_repair,
                              title: 'Firend',
                              iconColor: Colors.white,
                              textColor: Colors.white),
                          CustomIconText(
                              icon: Icons.car_rental_rounded,
                              title: 'Car',
                              iconColor: Colors.white,
                              textColor: Colors.white),
                          CustomIconText(
                              icon: Icons.card_travel_rounded,
                              title: 'Vocation',
                              iconColor: Colors.white,
                              textColor: Colors.white),
                        ],
                      ),
                      Text(
                        '$startDate  $endDate',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: IconsTextWidget(
                  title: 'Picture',
                  icon: Icons.image,
                  color: Colors.lightGreen))
        ],
      ),
    );
  }
}
