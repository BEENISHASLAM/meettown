import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/Controller/matchController.dart';
import 'package:meettown/modelView/api_url/api_url.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SendRequestList extends StatefulWidget {
  const SendRequestList({super.key});

  @override
  State<SendRequestList> createState() => _SendRequestListState();
}

class _SendRequestListState extends State<SendRequestList> {
  final MatchController controller = Get.put(MatchController());

  @override
  void initState() {
  
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.GetBySendList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize the controller

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return  Skeletonizer(
              enabled: controller.isLoading.value,
              effect: ShimmerEffect(
                highlightColor: Colors.white,
                baseColor: Color.fromARGB(255, 178, 178, 178),
                
              ),
              child: _buildListStatic([])
              );
              } else if (controller.errorMessage.isNotEmpty) {
                return Center(child: Text("Error: ${controller.errorMessage}"));
              } else if (controller.userProfilesSendList.isEmpty) {
                return _buildEmptyState();
              } else {
                return _buildList(controller.userProfilesSendList);
                // return Container();
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: 16),
          Text(
            "No items found",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: appColors.textBlueColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Please check back later",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListStatic(List<dynamic> data) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
  margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      decoration: BoxDecoration(
      color:  Color.fromARGB(255, 238, 239, 239).withOpacity(0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image and Title
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://thumbs.dreamstime.com/z/internet-things-concept-cloud-computing-technology-different-icon-elements-digital-network-connection-modern-92237214.jpg", // Placeholder for profile image URL
                ),
                radius: 24,
              ),
              title: Text(
              ""
                ,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 239, 241, 245),
                ),
              ),
              subtitle: Text(
                "",
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 1, 37, 66),
                ),
              ),
             
            ),
          

            // Email
          

            // Divider
           
             
            
          ],
        ),
      ),
    ),
  ),
);
      },
    );
  }


  Widget _buildList(List<dynamic> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
   var item  = data[index];
        return Card(
  margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      decoration: BoxDecoration(
      color:  Color(0xff005F61).withOpacity(0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image and Title
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                   ApiUrl.imageUrl + item["receiverId"]["profileImage"]["file"], // Placeholder for profile image URL
                ),
                radius: 24,
              ),
              title: Text(
                item["receiverId"]["authId"]["firstName"].toString()+" "+
                item["receiverId"]["authId"]["lastName"].toString()
                ,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 239, 241, 245),
                ),
              ),
              subtitle: Text(
                 item["receiverId"]["authId"]["email"],
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 1, 37, 66),
                ),
              ),
             
            ),
          

            // Email
          

            // Divider
           
             
            
          ],
        ),
      ),
    ),
  ),
);
      },
    );
  }
}
