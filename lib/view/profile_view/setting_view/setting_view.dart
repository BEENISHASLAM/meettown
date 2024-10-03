import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black)),
          title: Text(
            'Setting',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                Text(
                  "Account Setting",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CustomSettingTextIcons(
                          onPressed: () {}, title: 'Personal Informaion'),
                      CustomSettingTextIcons(
                          onPressed: () {}, title: 'Login Info'),
                      CustomSettingTextIcons(
                          onPressed: () {}, title: 'Notification'),
                      CustomSettingTextIcons(
                          onPressed: () {}, title: 'Membarship'),
                      CustomSettingTextIcons(onPressed: () {}, title: 'Privacy'),
                      CustomSettingTextIcons(
                          onPressed: () {}, title: 'Blacklist'),
                      CustomSettingTextIcons(
                          onPressed: () {}, title: 'Delete Account'),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 2),
                                  blurRadius: 2)
                            ],
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "Account Setting",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CustomSettingTextIcons(
                          onPressed: () {}, title: 'About Meeetown'),
                      CustomSettingTextIcons(
                          onPressed: () {}, title: 'Privacy Policy'),
                      CustomSettingTextIcons(
                          onPressed: () {}, title: 'Terms and Condition'),
                      CustomSettingTextIcons(
                          onPressed: () {}, title: 'Contct us'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSettingTextIcons extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const CustomSettingTextIcons(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Spacer(),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 20,
              ),
            )
          ],
        ),
        Divider()
      ],
    );
  }
}
