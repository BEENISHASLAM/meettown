import 'package:flutter/material.dart';
import 'package:meettown/res/components/post_cart.dart';
import 'package:meettown/view/SearchUser/search_view/location_view/user_profile_view.dart';
import 'package:provider/provider.dart';

import '../../../modelView/Filter/search_match_by_interest_controller.dart';

class ShareView extends StatefulWidget {
  const ShareView({super.key});

  @override
  State<ShareView> createState() => _ShareViewState();
}

class _ShareViewState extends State<ShareView> {
  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback to call the API after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Provider.of<SearchUserByInterestController>(context, listen: false);
      controller.fetchUserByMatchInterest();
    });
  }
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SearchUserByInterestController>(context);
    return ListView.builder(
      itemCount:controller.userProfilesList?.length,
      itemBuilder: (BuildContext context, int index) {
        final userProfile = controller.userProfilesList![index];
        final imgBaseUrl = userProfile.userData?.profileImage?.file;
        final endPoint = 'https://res.cloudinary.com/dkfgfnbst/image/upload/';
        final imgUrl = endPoint+imgBaseUrl!;
        print(imgUrl);
        return PostCart(
          profile:userProfile,
            name: userProfile.userData!.authId!.firstName?? 'null' ,
            distance: userProfile.distanceKm,
            gender: userProfile.userData!.authId!.gender?? 'null' ,
            image: imgUrl,
            onCommentTap: (){}, onHeartTap: (){},
          location: userProfile.userData!.nationality ?? 'null',
          count: userProfile.userData?.matchedInterestsCount);
      },
    );
  }
}