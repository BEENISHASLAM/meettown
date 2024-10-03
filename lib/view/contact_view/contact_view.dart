import 'package:flutter/material.dart';

import 'package:meettown/view/contact_view/interest_me_view/interest_me.dart';
import 'package:meettown/view/contact_view/match_view/match_view.dart';
import 'package:meettown/view/contact_view/my_likes_view/my_likes_view.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              title: Text(
                'Contact',
                style: TextStyle(color: Colors.black),
              )),
          body: Column(
            children: [
              Container(
                // width: MediaQuery.of(context).size.width*.9,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.grey,
                    splashBorderRadius: BorderRadius.circular(50),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: Offset(3, 0))
                      ],
                      color: Colors.white,
                    ),
                    tabs: [
                      Tab(
                        text: 'Match',
                        // icon: Icon(
                        //   Icons.directions_walk_outlined,
                        //   size: 30,
                        // ),
                      ),
                      Tab(
                        text: 'Interest in me',
                        // icon: Icon(
                        //   Icons.airplane_ticket,
                        //   color: Colors.lightBlue,
                        //   size: 30,
                        // ),
                      ),
                      Tab(
                        text: 'My likes',
                        // icon: Icon(
                        //   Icons.shopping_bag,
                        //   color: Colors.lightGreen,
                        //   size: 30,
                        // ),
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  MatchView(),
                  InterestedMe(),
                  MyLikesView(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
