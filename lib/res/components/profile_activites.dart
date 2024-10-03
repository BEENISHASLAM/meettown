import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';

class ProfileActivites extends StatelessWidget {
  final Map post;
  const ProfileActivites({super.key,required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: const Color.fromARGB(255, 255, 255, 255),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CachedNetworkImage(
              imageUrl: post['userImageUrl'],
              placeholder: (context, url) => CircleAvatar(
                radius: 30,
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: 30,
                child: Icon(Icons.error),
              ),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
                radius: 30,
              ),
            ),
            title: Text(
              post['userName'],
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on),
                // SizedBox(
                //   width: 10,
                // ),
                Text('France')
              ],
            ),
            trailing: Column(
              children: [
                   Icon(Icons.more_horiz),
                  SizedBox(height: 5,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Text(
                    'Moment',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: appColors.textBlueColor,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CachedNetworkImage(
              imageUrl: post['PostImage'],
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
                width: double.infinity,
              ),
              placeholder: (context, url) => Container(
                width: double.infinity,
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: double.infinity,
                height: 200,
                child: Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              post['postContent'],
              style: TextStyle(
                  color: appColors.textBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Text('celibataire'),
          ),
          Divider(),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 15,
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  // Handle like button pressed
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.comment,
                  color: appColors.textBlueColor,
                ),
                onPressed: () {
                  // Handle comment button pressed
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: appColors.textBlueColor,
                ),
                onPressed: () {
                  // Handle share button pressed
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
