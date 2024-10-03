import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../../modelView/Filter/cardSwip_controller.dart';

class SwipeExample extends StatefulWidget {
  const SwipeExample({super.key});

  @override
  State<SwipeExample> createState() => _SwipeExampleState();
}

class _SwipeExampleState extends State<SwipeExample> {
  int currentindex = 0;
  PaletteGenerator? paletteGenerator;

  Color defaultcolor = Colors.white;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Provider.of<CardSwipeController>(context, listen: false);
      controller.getFilterUser();
      // getColor();
    });
  }

  // List images=[
  //   'https://img.freepik.com/premium-photo/young-beautiful-woman-is-walking-park-summer-girl-is-walking-spring-field-warm_372948-918.jpg?w=360',
  //
  // ];
  getColor() async {
    //paletteGenerator =await PaletteGenerator.fromImageProvider(NetworkImage(images[currentindex]));

    if (paletteGenerator!.mutedColor != null) {
      defaultcolor = paletteGenerator!.mutedColor!.color;
    } else if (paletteGenerator!.vibrantColor != null) {
      defaultcolor = paletteGenerator!.vibrantColor!.color;
    } else if (paletteGenerator!.dominantColor != null) {
      defaultcolor = paletteGenerator!.dominantColor!.color;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CardSwipeController>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: controller.loading
          ? Center(child: CircularProgressIndicator())
          : controller.userProfilesList!.isEmpty
              ? Center(child: Text('No profiles available'))
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 650,
                  child: CardSwiper(
                    cardsCount: controller.userProfilesList!.length,
                    cardBuilder: (context, index, x, y) {
                      final userProfile = controller.userProfilesList![index];
                      final imgBaseUrl = userProfile.profileImage?.file;
                      if (imgBaseUrl == null) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Center(child: Text('Image not available')),
                        );
                      }

                      final endPoint = 'https://res.cloudinary.com/dkfgfnbst/image/upload/';
                      final imgUrl = endPoint + imgBaseUrl;
                      print(imgUrl);

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(child: Text('Image not available'));
                          },
                        ),
                      );
                    },
                    onSwipe: (prevoius, current, direction) {
                      currentindex = current!;
                      final userProfile = controller.userProfilesList![current];
                      final id = userProfile.sId;
                      // getColor();
                      if (direction == CardSwiperDirection.top) {
                        Fluttertoast.showToast(msg: '🔥 Send Request', backgroundColor: const Color.fromARGB(255, 84, 2, 2), fontSize: 28);
                        controller.sendRequest(id);
                      } else if (direction == CardSwiperDirection.bottom) {
                        Fluttertoast.showToast(msg: '😖 Reject Request', backgroundColor: const Color.fromARGB(255, 38, 1, 1), fontSize: 28);
                      }
                      return true;
                    },
                  ),
                ),
    );
  }
}
