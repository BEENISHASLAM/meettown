import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/res/components/post_cart.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../modelView/Filter/search_match_by_interest_controller.dart';

class ShareView extends StatefulWidget {
  const ShareView({super.key});

  @override
  State<ShareView> createState() => _ShareViewState();
}

class _ShareViewState extends State<ShareView> {
  final controller = Get.put(SearchUserByInterestController());
  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback to call the API after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchUserByMatchInterest();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.loading.value
          ? Skeletonizer(
              enabled: controller.loading.value,
              effect: ShimmerEffect(
                highlightColor: Colors.white,
                baseColor: Color.fromARGB(255, 178, 178, 178),
              ),
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return PostCart(
                      profile: [],
                      name: 'null',
                      distance: "",
                      gender: 'null',
                      image: "https://www.shutterstock.com/image-photo/perfect-match-smiling-arab-man-260nw-2253158921.jpg",
                      onCommentTap: () {},
                      onHeartTap: () {},
                      location: 'null',
                      count: "0");
                },
              ),
            )
          : ListView.builder(
              itemCount: controller.userProfilesList?.length,
              itemBuilder: (BuildContext context, int index) {
                final userProfile = controller.userProfilesList![index];
                final imgBaseUrl = userProfile.userData?.profileImage?.file;
                final endPoint = 'https://res.cloudinary.com/dkfgfnbst/image/upload/';
                final imgUrl = endPoint + imgBaseUrl!;
                print(imgUrl);
                return PostCart(
                    profile: userProfile,
                    name: userProfile.userData!.authId!.firstName ?? 'null',
                    distance: userProfile.distanceKm,
                    gender: userProfile.userData!.authId!.gender ?? 'null',
                    image: imgUrl,
                    onCommentTap: () {},
                    onHeartTap: () {},
                    location: userProfile.userData!.nationality ?? 'null',
                    count: userProfile.userData?.matchedInterestsCount);
              },
            );
    });
  }
}
