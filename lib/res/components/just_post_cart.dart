import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:meettown/view/profile_view/profile_view.dart';

class JustPostCart extends StatelessWidget {
  final String image, title, countryName;
  const JustPostCart(
      {super.key,
      required this.image,
      required this.title,
      required this.countryName,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
               Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfileView(
                    name:title ,
                  )));
            },
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
                radius: 40,
              ),
              imageUrl: image,
              placeholder: (context, url) => CircleAvatar(
                child: CircularProgressIndicator(),
                radius: 40,
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                child: Icon(Icons.error),
                radius: 40,
              ),
            ),
          ),

          // Image.network(image),
          Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: appColors.textBlueColor)),
          // Row(
          //   children: [
          //     Image.asset(
          //       countryImage,
          //       width: 20,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(4.0),
          //       child: Text(countryName),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
