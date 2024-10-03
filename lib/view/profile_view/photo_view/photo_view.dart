import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            IconsTextWidget(title: "Profile Photo", icon: Icons.image, color: Colors.lightGreen),
      
           
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: appColors.textBlueColor,
                  radius: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      Text(
                        'add',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 16,),
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://img.freepik.com/free-photo/close-up-contemplated-handsome-young-man-purple-polo-neck-t-shirt_23-2148130395.jpg?w=360&t=st=1711732160~exp=1711732760~hmac=288cc3e978bceecf7c3f8c1d70fa73281daadc7a15dda734110a24a0ed542b9c',
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        radius: 40,
                      ),
                      placeholder: (context, url) => CircleAvatar(
                        child: Center(
                            child: SizedBox(
                                width: 15,
                                height: 15,
                                child: CircularProgressIndicator())),
                        radius: 20,
                      ),
                      errorWidget: (context, url, error) => CircleAvatar(
                        child: Center(
                          child: Icon(Icons.error),
                        ),
                        radius: 40,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 15,
                          backgroundColor: Colors.grey,
                          child: Center(
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                            ),
                          )),
                    )
                  ],
                ),
              ],
            ),
      SizedBox(height: 16,),
      
            IconsTextWidget(title: "Gallery", icon: Icons.image, color: Colors.lightGreen),
      SizedBox(height: 16,),
      
            CircleAvatar(
              backgroundColor: appColors.textBlueColor,
              radius: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  Text(
                    'add',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
      SizedBox(height: 16,),
             IconsTextWidget(title: 'Video', icon: Icons.videocam_rounded, color: appColors.textBlueColor),
      SizedBox(height: 16,),
      Container(
        width: MediaQuery.of(context).size.width/2,
        height: 120,
        color:appColors.textBlueColor,
        child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      Text(
                        'add',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
      )
          ],
        ),
      ),
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
        Icon(
          icon,
          color: color,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: appColors.textBlueColor),
        ),
      ],
    );
  }
}
