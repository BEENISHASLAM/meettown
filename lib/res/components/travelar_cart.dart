import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meettown/res/components/custon_icon_text_title.dart';

class TravelarView extends StatelessWidget {
 final String name,image,flagImage,duration,tranportType,vocation,tranportWith,countryName,level;
final  IconData tranportTypeIcon,vocationIcons,tranportWithIcons;
  const TravelarView({super.key,required this.name,required this.image,required this.flagImage,required this.duration,required this.tranportType,required this.tranportTypeIcon,required this.tranportWith,required this.tranportWithIcons,required this.vocation,required this.vocationIcons,required this.countryName,required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: image,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 40,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) => CircleAvatar(
                  radius: 40,
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => CircleAvatar(
                  radius: 40,
                  child: Center(
                    child: Icon(Icons.error),
                  ),
                ),
              ),
              Text('$name , $level'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: flagImage,
                    imageBuilder: (context, imageProvider) => Image(
                      image: imageProvider,
                      width: 30,
                    ),
                    placeholder: (context, url) => CircleAvatar(
                      radius: 10,
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => CircleAvatar(
                      radius: 10,
                      child: Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    countryName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(Icons.calendar_month,color: Colors.black,size: 15,),
                  ),
                  Text(duration)
                ],
              ),
              CustomIconText(icon: tranportTypeIcon, title:  tranportType, iconColor: Colors.black,textColor: Colors.black,),
              CustomIconText(icon: tranportWithIcons, title:  tranportWith,iconColor: Colors.black,textColor: Colors.black)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              SizedBox(height: 50,),
                  CustomIconText(icon: vocationIcons, title: vocation,iconColor: Colors.black,textColor: Colors.black),
              
            ],
          )
        ],
      ),
    );
  }
}
