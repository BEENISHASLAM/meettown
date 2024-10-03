import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
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
                  'https://img.freepik.com/free-photo/close-up-contemplated-handsome-young-man-purple-polo-neck-t-shirt_23-2148130395.jpg?w=360&t=st=1711732160~exp=1711732760~hmac=288cc3e978bceecf7c3f8c1d70fa73281daadc7a15dda734110a24a0ed542b9c',
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
  String image;
  CustomImageAppBar({super.key, required this.image});

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
                  'https://img.freepik.com/free-photo/close-up-contemplated-handsome-young-man-purple-polo-neck-t-shirt_23-2148130395.jpg?w=360&t=st=1711732160~exp=1711732760~hmac=288cc3e978bceecf7c3f8c1d70fa73281daadc7a15dda734110a24a0ed542b9c',
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
      title:   image.toString().contains("https") ?  Image(
        image: NetworkImage(
          image.toString(),
        ),
        // color: Colors.blue,
      ):Image(
        image: AssetImage(
          image.toString(),
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
