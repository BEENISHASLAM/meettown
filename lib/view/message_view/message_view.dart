import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/components/custom_appbar.dart';
import 'package:meettown/view/message_view/chat_view.dart';
import 'package:meettown/view/message_view/notification_view.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: CustomAppBar(
              title: 'Messages',
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Match',
                style: TextStyle(
                    color: appColors.textBlueColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // color: Color.fromARGB(196, 100, 100, 100),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/imgs/dummy_users.jpg',
                      ),
                      opacity: .5,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Color.fromARGB(196, 53, 53, 53), BlendMode.darken),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                child: TabBar(
                   indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: appColors.textBlueColor,
                    labelStyle: TextStyle(
                        color: appColors.textBlueColor,
                        fontWeight: FontWeight.bold),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: 'Chats',
                      ),
                      Tab(
                        text: 'Notifications',
                      ),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: TabBarView(children: [
                ChatsView(),
                NotificationView(),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
