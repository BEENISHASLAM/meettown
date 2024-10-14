import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meettown/view/SearchUser/search_view/location_view/user_profile_view.dart';

// ignore: must_be_immutable
class PostCart extends StatefulWidget {
  var profile;
  String name, image, location, gender;
  final distance;
  final count;
  Function()? onHeartTap, onCommentTap;
  PostCart({
    super.key,
    this.profile,
    required this.name,
    required this.distance,
    required this.gender,
    required this.image,
    required this.location,
    required this.onCommentTap,
    required this.onHeartTap,
    this.count,
  });

  @override
  State<PostCart> createState() => _PostCartState();
}

class _PostCartState extends State<PostCart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserProfileView(profile: widget.profile.userData), // Use actual user name
                      ),
                    );
          },
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [BoxShadow(offset: Offset(2, 2), color: Color.fromARGB(255, 232, 232, 232), blurRadius: 2)],
                  borderRadius: BorderRadius.circular(4)),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        color: Colors.amber,
                        fit: BoxFit.cover,
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        imageUrl: widget.image,
                        imageBuilder: (context, imageProvider) => ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image(
                            image: imageProvider,
                            width: double.infinity,
                          ),
                        ),
                        placeholder: (context, url) => Container(
                          width: double.infinity,
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: double.infinity,
                          height: 100,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.name,
                                        style: TextStyle(color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        widget.gender,
                                        style: TextStyle(color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      widget.location,
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text(
                        'O',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                      ),
                    ),
                    title: Text(
                      'Common Interested(${widget.count})',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.social_distance),
                        Text(
                          widget.distance,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // GestureDetector(
                //   onTap: onHeartTap,
                //   child: Container(
                //     padding: EdgeInsets.all(10),
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         boxShadow: [BoxShadow(offset: Offset(5, 5), color: Colors.grey, blurRadius: 50)],
                //         borderRadius: BorderRadius.circular(50)),
                //     child: Icon(
                //       Icons.comment,
                //       size: 30,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
              
                GestureDetector(
                  onTap: widget.onCommentTap,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(offset: Offset(5, 5), color: Colors.grey, blurRadius: 50)],
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
