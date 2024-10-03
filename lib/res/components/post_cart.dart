import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class PostCart extends StatelessWidget {
  String name, image, location, gender;
    final distance;
  final count ;
  Function()? onHeartTap,onCommentTap;
   PostCart({super.key,required this.name,required this.distance,
     required this.gender,required this.image,required this.location,
     required this.onCommentTap,required this.onHeartTap,
      this.count,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 2),
                      color: Color.fromARGB(255, 232, 232, 232),
                      blurRadius: 2)
                ],
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          image,
                      imageBuilder: (context, imageProvider) => ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image(
                          image: imageProvider,
                          width: double.infinity,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Column(
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Text(
                                      gender,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
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
                                    location,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
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
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  title: Text(
                    'Common Interested($count)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.social_distance),
                      Text(
                       distance,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onHeartTap,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.grey,
                            blurRadius: 50)
                      ],
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.comment,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              GestureDetector(
                onTap: onCommentTap,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.grey,
                            blurRadius: 50)
                      ],
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
    );
  }
}
