import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/Controller/matchController.dart';
import 'package:meettown/res/appcolors.dart';

class MatchView extends StatefulWidget {
  const MatchView({super.key});

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  final MatchController controller = Get.put(MatchController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchUserByMatchInterest();
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
          // Header
          Text(
            "Explore Matches",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: appColors.textBlueColor,
            ),
          ),
          SizedBox(height: 8),

          // Subtitle
          Text(
            "Find the latest posts below",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 16),

          // Content
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.errorMessage.isNotEmpty) {
                return Center(child: Text("Error: ${controller.errorMessage}"));
              } else if (controller.userProfilesList.isEmpty) {
                return _buildEmptyState();
              } else {
                return _buildList(controller.userProfilesList);
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

  Widget _buildList(List<dynamic> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        print(item);
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  item['senderId']["authId"]["firstName"] ?? "No Title",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: appColors.textBlueColor,
                  ),
                ),
                SizedBox(height: 8),

                // Description
                Text(
                  item['senderId']["authId"]["email"] ?? "No Description available",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),

                // Metadata or additional info
                SizedBox(height: 12),
                Text(
                  "Posted on:  'N/A'}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
