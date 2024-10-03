import 'package:flutter/material.dart';
import 'package:meettown/res/components/profile_activites.dart';


// ignore: must_be_immutable
class ActivitiesView extends StatefulWidget {
  ActivitiesView({super.key});

  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  final List posts = [
    {
      'userName': 'John Doe',
      'userImageUrl':
          'https://img.freepik.com/free-photo/close-up-contemplated-handsome-young-man-purple-polo-neck-t-shirt_23-2148130395.jpg?w=360&t=st=1711732160~exp=1711732760~hmac=288cc3e978bceecf7c3f8c1d70fa73281daadc7a15dda734110a24a0ed542b9c',
      'postContent': 'Travel to us After Long Time Any One Join.',
      'PostImage':
          "https://img.freepik.com/free-photo/new-york-city-manhattan-with-statue-liberty_649448-1583.jpg?size=626&ext=jpg"
    },
    {
      'userName': 'Gale Smith',
      'userImageUrl':
          'https://img.freepik.com/free-photo/smiley-woman-holding-tablet-close-up_23-2148943507.jpg?t=st=1711732160~exp=1711732760~hmac=0cd323b3dc9dab12a7ccc2a875aa07ea1f75047928443b556050d7162b02b888',
      'postContent': 'Join And Travel',
      'PostImage':
          "https://img.freepik.com/free-photo/lifestyle-attractive-girl-with-tablet_144627-13352.jpg?w=360&t=st=1711732119~exp=1711732719~hmac=989eedb7a92ea1c5e846d268ac8a768a0d0cc19d86bacc7bcef73b8c78759ea7"
    },
    {
      'userName': 'John Doe',
      'userImageUrl':
          'https://img.freepik.com/free-photo/close-up-contemplated-handsome-young-man-purple-polo-neck-t-shirt_23-2148130395.jpg?w=360&t=st=1711732160~exp=1711732760~hmac=288cc3e978bceecf7c3f8c1d70fa73281daadc7a15dda734110a24a0ed542b9c',
      'postContent': 'Travel to us After Long Time Any One Join.',
      'PostImage':
          "https://img.freepik.com/premium-photo/young-woman-using-phone-bridge-against-sky_1048944-2102552.jpg?w=360"
    },
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ProfileActivites(post: posts[index]);
      },
    );
  }
}
