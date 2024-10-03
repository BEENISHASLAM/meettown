import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageName extends StatelessWidget {
  String image,name;

   ImageName({super.key,required this.image,required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (context, imageProvider) => ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image(
              image: imageProvider,
              width: MediaQuery.of(context).size.width/5,
            ),
          ),
          placeholder: (context, url) => Container(
           width: MediaQuery.of(context).size.width/5,
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          ),
          errorWidget: (context, url, error) => Container(
            width: MediaQuery.of(context).size.width/5,
            height: 100,
            child: Center(
              child: Icon(Icons.error),
            ),
          ),
        ),
        Positioned(
       bottom: 5,
          child: Text(name,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),))
      ],
    );
  }
}
