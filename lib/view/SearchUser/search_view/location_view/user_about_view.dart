// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/Controller/getUserController.dart';
import 'package:meettown/res/appcolors.dart';

class UserAboutView extends StatefulWidget {
  UserAboutView({super.key});
  @override
  State<UserAboutView> createState() => _UserAboutViewState();
}

class _UserAboutViewState extends State<UserAboutView> {
  var userController = Get.put(UserProfileController());

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255, // Alpha
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Obx(() {
        return userController.isLoading.value
            ? SizedBox.shrink()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  userController.userProfiles.value.first.about.toString().isNotEmpty
                      ? Text(
                          userController.userProfiles.value.first.about.toString(),
                          style: TextStyle(fontSize: 16),
                        )
                      : SizedBox.shrink(),
                  SizedBox(height: 16),
                  Divider(color: Color.fromARGB(255, 208, 205, 205), height: 20),
                  Card(
                    elevation: 1,
                    // shadowColor: Colors.white,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'I Am Looking For',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: appColors.textBlueColor,
                                    radius: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(Icons.group, size: 40, color: Colors.white),
                                    )),
                                SizedBox(width: 8),
                                Text(
                                  'Socialising',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: appColors.textBlueColor,
                              border: Border.all(
                                color: const Color.fromARGB(255, 152, 152, 152),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'In My Passport',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            color: Color(0xfff1f7f7),
                            child: Column(
                              children: [
                                Divider(color: Colors.white),
                                buildPassportDetail(
                                    'Gender',
                                    userController.userProfiles.value.first.authId.gender == null
                                        ? ""
                                        : userController.userProfiles.value.first.authId.gender),
                                buildPassportDetail(
                                    'Relationship Status',
                                    userController.userProfiles.value.first.relationShip == null
                                        ? ""
                                        : userController.userProfiles.value.first.relationShip),
                                buildPassportDetail(
                                    'Profession',
                                    userController.userProfiles.value.first.professional == null
                                        ? ""
                                        : userController.userProfiles.value.first.professional),
                                buildPassportDetail('I Speak', userController.userProfiles.value.first.language),
                                buildPassportDetail('Education', userController.userProfiles.value.first.education),
                                buildPassportDetail('Height', userController.userProfiles.value.first.height),
                                buildPassportDetail('Body', userController.userProfiles.value.first.body),
                                buildPassportDetail('Children', userController.userProfiles.value.first.children.toString()),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  userController.interests.value.length > 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Interests',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: appColors.textBlueColor,
                              ),
                            ),
                            SizedBox(height: 8),
                            Wrap(
                              spacing: 8.0, // Horizontal spacing
                              runSpacing: 4.0, // Vertical spacing
                              children: userController.interests.value.map((interest) {
                                return Chip(
                                  label: Text(interest),
                                  backgroundColor: getRandomColor(),
                                  labelStyle: TextStyle(color: Colors.white),
                                );
                              }).toList(),
                            )
                          ],
                        )
                      : Text(""),
                ],
              );
      }),
    );
  }

  Widget buildPassportDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 117, 116, 116),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: appColors.textBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SimpleBoldText extends StatelessWidget {
  String title;
  Color color;
  SimpleBoldText({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
    );
  }
}

// ignore: must_be_immutable
class SimpleText extends StatelessWidget {
  String title;
  Color color;
  SimpleText({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 16, color: color),
    );
  }
}
