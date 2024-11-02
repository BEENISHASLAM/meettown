import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContactMyLikes extends StatelessWidget {
  final String name, image, gender, location,online;
  final Function()? onHeartTap, onCommentTap;

  ContactMyLikes({
    Key? key,
    required this.online,
    required this.name,
    required this.gender,
    required this.image,
    required this.location,
    required this.onCommentTap,
    required this.onHeartTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, // Fixed height to avoid overflow
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: image,
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image(
                      image: imageProvider,
                      width: double.infinity,
                      fit: BoxFit.cover, // Ensures the image covers the area
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
                    child: Center(child: Icon(Icons.error)),
                  ),
                ),
                  Positioned(
            top: 8,
            right: 5,
            child: Icon(
              online=="true" ? Icons.circle : Icons.circle_outlined,
              color:  online=="true" ? Colors.green : Colors.red,
              size: 20,
            ),
          ),
                Positioned(
                  bottom: 0,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Column(
                              children: [
                                // Text(
                                //   name,
                                //   style: TextStyle(
                                //       color: Colors.white, fontSize: 16),
                                // ),
                                // Text(
                                //   gender,
                                //   style: TextStyle(
                                //       color: Colors.white, fontSize: 12),
                                // ),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: onHeartTap,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    color: Colors.grey,
                                    blurRadius: 50)
                              ],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.comment,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        // GestureDetector(
                        //   onTap: onCommentTap,
                        //   child: Container(
                        //     padding: EdgeInsets.all(5),
                        //     decoration: BoxDecoration(
                        //       color: Colors.red,
                        //       boxShadow: [
                        //         BoxShadow(
                        //             offset: Offset(5, 5),
                        //             color: Colors.grey,
                        //             blurRadius: 50)
                        //       ],
                        //       borderRadius: BorderRadius.circular(50),
                        //     ),
                        //     child: Icon(
                        //       Icons.favorite,
                        //       size: 20,
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : 'N',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
            title: Row(
                                  children: [
                                   
                                    // Space between icon and name
                                    Text(
                                      name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 11),
                                    ),
                                  
          
        ],
      ),)]));
    
  }
}
