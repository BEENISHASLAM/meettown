import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meettown/modelView/Auth/Dashboard/home_controller.dart';
import 'package:meettown/modelView/api_url/api_url.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/components/custom_appbar.dart';
import 'package:meettown/res/components/just_post_cart.dart';
import 'package:meettown/view/Feeds/MainFeeds.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    getPost();
  }

  getPost() {
    controller.getPostWithEarliestTimestamp();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: CustomImageAppBar(
              image1:
                  'https://www.meetown.com/public/imgs/logo.png?VER=2574fe7d88989cfcaf296731730b8a6e',
            )),
        body: GetBuilder<HomeController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                GestureDetector(
                  onTap: () {
                    controller.showUploadDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            FontAwesomeIcons.penToSquare,
                            color: appColors.textBlueColor,
                          ),
                        ),
                        Text('Share your moment...'),
                        Spacer(),
                        Icon(
                          Icons.image,
                          color: Colors.green,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.videocam,
                          color: appColors.textBlueColor,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(),
                controller.loading
                    ? Skeletonizer(
                        enabled: controller.loading,
                        effect: ShimmerEffect(
                          highlightColor: Colors.white,
                          baseColor: Color.fromARGB(255, 178, 178, 178),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            // controller.postData[index]["isLike"] = "Like";
                            return PostItemStatic();
                          },
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.postData.length,
                        itemBuilder: (context, index) {
                          controller.postData[index]["isLike"] = "Like";
                          return PostItem(post: controller.postData[index]);
                        },
                      ),
              ],
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appColors.textBlueColor,
          onPressed: () {},
          child: Icon(
            Icons.filter_list_alt,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
