import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/Controller/matchController.dart';
import 'package:meettown/modelView/api_url/api_url.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecieveRequest extends StatefulWidget {
  const RecieveRequest({super.key});

  @override
  State<RecieveRequest> createState() => _RecieveRequestState();
}

class _RecieveRequestState extends State<RecieveRequest> {
  final MatchController controller = Get.put(MatchController());

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.GetByRecieveList();
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
              }else if (controller.errorMessage.isNotEmpty) {
                return Center(child: Text("Error: ${controller.errorMessage}"));
              } else if (controller.userProfilesRecieveList.isEmpty) {
                return _buildEmptyState();
              } else {
                return 
              controller.isLoadingBtn.value
    ? Center(
      child: Container(
          width: 30, // Set the width
          height: 30, // Set the height
          alignment: Alignment.center, // Center the progress indicator inside the container
          child: CircularProgressIndicator(
            strokeWidth: 2.0, // Make the progress indicator thinner
            color: const Color.fromARGB(255, 1, 26, 46),
          ),
        ),
    )
    : _buildList(controller.userProfilesRecieveList);

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
  final MatchController controller = Get.put(MatchController());

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
                   ApiUrl.imageUrl + item["senderId"]["profileImage"]["file"], // Placeholder for profile image URL
                ),
                radius: 24,
              ),
              title: Text(
                item["senderId"]["authId"]["firstName"].toString()+" "+
                item["senderId"]["authId"]["lastName"].toString()
                ,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 239, 241, 245),
                ),
              ),
              subtitle: Text(
                 item["senderId"]["authId"]["email"],
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 1, 37, 66),
                ),
              ),
             
            ),


            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(onPressed: (){
                    // AcceptRequest
                    controller.AcceptRequest(context,item["_id"],index);
                    print(item["_id"]);
                    
                  },
                    style: ElevatedButton.styleFrom(
                    // backgroundColor: Color.fromARGB(255, 24, 60, 1),
                    // foregroundColor: Colors.white
                   ),
                   child: Text("Accept")),
                     Padding(
                       padding: const EdgeInsets.only(left:7.0),
                       child: ElevatedButton(onPressed: (){},
                       style: ElevatedButton.styleFrom(
                        // backgroundColor: const Color.fromARGB(255, 28, 2, 0),
                        // foregroundColor: Colors.white
                       ),
                                          child: Text("Reject")),
                     ),
                ],
              ),
            )
          

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
