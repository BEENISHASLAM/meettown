import 'package:flutter/material.dart';
import 'package:meettown/modelView/api_url/api_url.dart';
import 'package:meettown/res/components/contacts_my_likes.dart';
import 'package:get/get.dart';
import 'package:meettown/Controller/matchController.dart';
import 'package:meettown/view/Dashboard/Chat_View/ChatScreen.dart';
import 'package:meettown/view/message_view/message_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../SearchUser/search_view/location_view/friend_view.dart';

class MyFriendsList extends StatefulWidget {
  const MyFriendsList({super.key});

  @override
  State<MyFriendsList> createState() => _MyFriendsListState();
}

class _MyFriendsListState extends State<MyFriendsList> {
  final MatchController controller = Get.put(MatchController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.GetFriendList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return controller.isLoading.value
            ? Skeletonizer(
                enabled: controller.isLoading.value,
                effect: ShimmerEffect(
                  highlightColor: Colors.white,
                  baseColor: Color.fromARGB(255, 178, 178, 178),
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ContactMyLikes(
                        online: "true",
                        name: 'Gab',
                        gender: 'Male',
                        image:
                            'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea',
                        location: 'Paris,France',
                        onCommentTap: () {},
                        onHeartTap: () {});
                  },
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: controller.userFriendsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print(controller.userFriendsList[index]);
                      var profileData = controller.userFriendsList[index];
                      profileData["sId"] =
                          controller.userFriendsList[index]["_id"];
                      print(profileData);
                      Get.to(FriendProfileView(
                        profile: profileData,
                      ));
                    },
                    child: ContactMyLikes(
                        online: controller.userFriendsList[index]["authId"]
                                ["online"]
                            .toString(),
                        name: controller.userFriendsList[index]["authId"]
                                    ["firstName"]
                                .toString() +
                            " " +
                            controller.userFriendsList[index]["authId"]
                                    ["lastName"]
                                .toString(),
                        gender: 'Male',
                        image: ApiUrl.imageUrl +
                            controller.userFriendsList[index]["profileImage"]
                                ["file"],
                        location: controller.userFriendsList[index]
                            ["nationality"],
                        onCommentTap: () {},
                        onHeartTap: () {
                          Get.to(MessageView());
                        }),
                  );
                },
              );
      }),
    );
  }
}
