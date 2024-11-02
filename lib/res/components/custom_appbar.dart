import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meettown/modelView/api_url/api_url.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/global.dart';
import 'package:meettown/view/contact_view/contact_view.dart';
import 'package:meettown/view/profile_view/profile_view.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
          padding: EdgeInsets.all(6.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfileView()));
            },
            child: CachedNetworkImage(
              imageUrl:
              ApiUrl.imageUrl+image,

                                imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
                radius: 20,
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
                radius: 20,
              ),
            ),
          )),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: appColors.textBlueColor),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(6.0),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ContactView()));
            },
            icon: Icon(
              Icons.handshake_outlined,
              size: 40,
              color: appColors.textBlueColor,
            ),
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomImageAppBar extends StatelessWidget {
  String image1;
  CustomImageAppBar({super.key, required this.image1});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
          padding: EdgeInsets.all(6.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfileView()));
            },
            child: CachedNetworkImage(
              imageUrl:
              ApiUrl.imageUrl+image,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
                radius: 20,
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
                radius: 20,
              ),
            ),
          )),
      centerTitle: true,
      title:   image1.toString().contains("https") ?  Image(
        image: NetworkImage(
          image1.toString(),
        ),
        // color: Colors.blue,
      ):Image(
        image: AssetImage(
          image1.toString(),
        ),
        color: Colors.blue,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(6.0),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ContactView()));
            },
            icon: Icon(
              Icons.handshake_outlined,
              size: 40,
              color: appColors.textBlueColor,
            ),
          ),
        )
      ],
    );
  }
}
