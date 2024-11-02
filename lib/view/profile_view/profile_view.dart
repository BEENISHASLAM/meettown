// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/Controller/FetchCurrentUseController.dart';
import 'package:meettown/modelView/api_url/api_url.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/Dashboard/Chat_View/ChatList.dart';
import 'package:meettown/view/profile_view/about_view/about_view.dart';
import 'package:meettown/view/profile_view/activities_view/activities_view.dart';
import 'package:meettown/view/profile_view/photo_view/photo_view.dart';
import 'package:meettown/view/profile_view/own_trip_view/own_trip_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatefulWidget {
  var name;
  ProfileView({super.key, this.name});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _showAppBar = true;

  var CurrentUserProfile =Get.put(CurrentUserProfileController());

  
  @override
  void initState() {
  
    super.initState();
    getUserProfile();
  }

  getUserProfile() async {
    await CurrentUserProfile.fetchCurrentUserProfileDetails();
    // print(userController.userProfiles.first);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [appColors.textBlueColor, const Color.fromARGB(255, 1, 20, 48)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back, size: 25, color: appColors.textBlueColor),
                          ),
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                          child: IconButton(
                            onPressed: () {
                              // Add your navigation to settings here
                            },
                            icon: Icon(Icons.settings, size: 25, color: appColors.textBlueColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Obx(() {
                          return CurrentUserProfile.isLoading.value
                              ? Skeletonizer(
                                  enabled: CurrentUserProfile.isLoading.value,
                                  effect: ShimmerEffect(
                                    highlightColor: Colors.white,
                                    baseColor: Color.fromARGB(255, 178, 178, 178),
                                  ),
                                  child: Container(
                                      height: 150,
                                      width: 100,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 5,
                                            color: Color.fromARGB(255, 252, 248, 248),
                                          ),
                                          boxShadow: [BoxShadow(color: const Color.fromARGB(255, 178, 177, 177))],
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                'https://global.discourse-cdn.com/bubble/original/3X/1/2/12e944afd917d123319c9074a7e72581785a3b38.png',
                                                //'$fullImageUrl',
                                              ),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: null),
                                )
                              : Container(
                                  height: 150,
                                  width: 100,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 5,
                                        color: Color.fromARGB(255, 252, 248, 248),
                                      ),
                                      boxShadow: [BoxShadow(color: const Color.fromARGB(255, 178, 177, 177))],
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            ApiUrl.imageUrl + CurrentUserProfile.userProfiles.value.first.profileImage.file,
                                            //'$fullImageUrl',
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: null);
                        }),
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(height: 10),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       // widget.name == null ||widget.name=="" ?  "Samantha Doe":widget.name,
                        //       "Samantha Doesasas",
                        //       style: TextStyle(
                        //         fontSize: 24,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //     Text(
                        //       'nationality',
                        //       style: TextStyle(color: Colors.white70, fontSize: 16),
                        //     ),
                        //     SizedBox(height: 25),
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         ElevatedButton.icon(
                        //           onPressed: () {},
                        //           icon: Icon(Icons.message),
                        //           label: Text("Message"),
                        //           style: ElevatedButton.styleFrom(
                        //             side: BorderSide(color: Colors.green, width: 2),
                        //             // shape: StadiumBorder(),
                        //             backgroundColor: Colors.white,
                        //             foregroundColor: Colors.green,
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(10), // Border radius
                        //             ),
                        //           ),
                        //         ),
                        //         SizedBox(width: 10),
                        //         ElevatedButton(
                        //           onPressed: () {},
                        //           child: Icon(Icons.favorite),
                        //           style: ElevatedButton.styleFrom(
                        //             foregroundColor: Colors.red,
                        //             backgroundColor: Colors.white,
                        //             shape: CircleBorder(),
                        //             padding: EdgeInsets.all(12),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        Obx(() {
                          return CurrentUserProfile.isLoading.value
                              ? Skeletonizer(
                                  enabled: CurrentUserProfile.isLoading.value,
                                  effect: ShimmerEffect(
                                    highlightColor: Colors.white,
                                    baseColor: Color.fromARGB(255, 178, 178, 178),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 50,
                                        child: Text(
                                       "jdhasdjh",
                                          style: TextStyle(color: Colors.white70, fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(height: 25),
                                    ],
                                  ))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                         CurrentUserProfile.userProfiles.first.authId.firstName.toString(),
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                       CurrentUserProfile.userProfiles.first.nationality.toString(),
                                      style: TextStyle(color: Colors.white70, fontSize: 16),
                                    ),
                                    SizedBox(height: 25),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 10),
                                          ElevatedButton.icon(
                                  onPressed: () {
                                    Get.to(ChatListScreen());
                                  },
                                  icon: Icon(Icons.message),
                                  label: Text("Chat With User"),
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(color: Colors.green, width: 2),
                                    // shape: StadiumBorder(),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10), // Border radius
                                    ),
                                  ),
                                ),
                                      ],
                                    ),
                                  ],
                                );
                        }),
                      ],
                    ),
                  ),
                  Divider(color: Color.fromARGB(255, 208, 205, 205), height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 238, 238),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromARGB(255, 226, 225, 225)),
                    ),
                    child: TabBar(
                        dividerColor: Colors.transparent,
                        indicatorColor: Colors.grey,
                        splashBorderRadius: BorderRadius.circular(50),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: appColors.textBlueColor, // Selected tab label color
                        unselectedLabelColor: Colors.grey, // Unselected tab label color
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.withOpacity(0.2), // Indicator color
                        ),
                        tabs: [
                          Tab(
                            text: 'About',
                            // icon: Icon(
                            //   Icons.directions_walk_outlined,
                            //   size: 30,
                            // ),
                          ),
                          Tab(
                            text: 'Photo',
                            // icon: Icon(
                            //   Icons.airplane_ticket,
                            //   color: Colors.lightBlue,
                            //   size: 30,
                            // ),
                          ),
                          Tab(
                            text: 'Trips',
                            // icon: Icon(
                            //   Icons.shopping_bag,
                            //   color: Colors.lightGreen,
                            //   size: 30,
                            // ),
                          ),
                          Tab(
                            text: 'activities',
                            //     icon: FaIcon(
                            //   FontAwesomeIcons.mapLocation,
                            //   size: 30,
                            //   color: const Color.fromARGB(255, 22, 104, 171),
                            // )
                          ),
                        ]),
                  ),
                  Expanded(
                      child: TabBarView(children: [
                    AboutView(),
                    PhotoView(),
                    OwnTripView(),
                    ActivitiesView(),
                  ]))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
