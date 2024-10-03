import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageNameProfile extends StatelessWidget {
  String image,name;

   ImageNameProfile({super.key,required this.image,required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (context, imageProvider) => CircleAvatar(
            radius: 45,
            backgroundImage: imageProvider,
          ),
          placeholder: (context, url) => CircleAvatar(
            radius: 45,child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) =>CircleAvatar(
            radius: 45,
              child: Icon(Icons.error),
            
          ),
        ),SizedBox(height: 10,),
        Text(name,textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)
      ],
    );
  }
}
