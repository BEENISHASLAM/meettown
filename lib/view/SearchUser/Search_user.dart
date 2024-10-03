import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meettown/res/components/custom_appbar.dart';
import 'package:meettown/res/components/filter_view.dart';
import 'package:meettown/view/SearchUser/CardSwipe.dart';
import 'package:meettown/view/SearchUser/search_view/current_location_view/current_location_view.dart';
import 'package:meettown/view/SearchUser/search_view/favoirate_view/favoirate_view.dart';
import 'package:meettown/view/SearchUser/search_view/location_view/location_view.dart';
import 'package:meettown/view/SearchUser/search_view/person_view.dart';
import 'package:meettown/view/SearchUser/search_view/share_view.dart';
import 'package:meettown/view/SearchUser/search_view/trip_view.dart';

class User {
  final String name;
  final String username;

  User({required this.name, required this.username});
}

class SearchUserPage extends StatefulWidget {
  @override
  _SearchUserPageState createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  // late List<User> _users;
  // late List<User> _filteredUsers;
  // TextEditingController _searchController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _users = [
  //     User(name: 'John Doe', username: '@johndoe'),
  //     User(name: 'Jane Smith', username: '@janesmith'),
  //     User(name: 'Alice Johnson', username: '@alicejohnson'),
  //   ];
  //   _filteredUsers = _users;
  // }

  // void _filterUsers(String query) {
  //   setState(() {
  //     _filteredUsers = _users
  //         .where((user) =>
  //             user.name.toLowerCase().contains(query.toLowerCase()) ||
  //             user.username.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60), child: CustomAppBar(title: 'Search',)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 232, 232, 232),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.grey,
                  // splashBorderRadius: BorderRadius.circular(10),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: Offset(3, 0))
                    ],
                    color: Colors.white,
                  ),
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.location_on,
                        size: 30,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.share,
                        color: Colors.lightGreen,
                        size: 30,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.group_outlined,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.airplane_ticket,
                        color: Colors.yellow,
                        size: 30,
                      ),
                    ),
                    Tab(
                        icon: FaIcon(
                      FontAwesomeIcons.mapLocation,
                      size: 30,
                      color: const Color.fromARGB(255, 22, 104, 171),
                    )),
                  ]),
            ),
                     Expanded(
                child: TabBarView(
              children: [
                LocationView(),
                SwipeExample(),
                ShareView(),
                PersonView(),
                TripSearchView(),
              CurrentLocationView(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
