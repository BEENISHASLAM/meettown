// import 'package:flutter/material.dart';
// import 'package:meettown/res/appcolors.dart';
// import 'package:meettown/view/Dashboard/home.dart';
// import 'package:meettown/view/SearchUser/Search_user.dart';
// import 'package:meettown/view/Trip_view/trip_view.dart';
// import 'package:meettown/view/message_view/message_view.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// class CustomNavbar extends StatefulWidget {
//   @override
//   _CustomNavbarState createState() => _CustomNavbarState();
// }

// class _CustomNavbarState extends State<CustomNavbar> {


//   @override
//   Widget build(BuildContext context) {
//     return  PersistentTabView(
//         context,
//         controller: PersistentTabController(initialIndex: 0),
//         items: [
//           PersistentBottomNavBarItem(
//               icon: Icon(Icons.home),
//               title: ("Dashboard"),
//               activeColorPrimary: appColors.textBlueColor,
//               inactiveColorPrimary: Colors.grey,),
//                   PersistentBottomNavBarItem(
//               icon: Icon(Icons.account_circle),
//               title: ("Search"),
//               activeColorPrimary: appColors.textBlueColor,
//               inactiveColorPrimary: Colors.grey),
//           PersistentBottomNavBarItem(
//               icon: Icon(Icons.airplanemode_active),
//               title: ("Trips"),
//               activeColorPrimary: appColors.textBlueColor,
//               inactiveColorPrimary: Colors.grey),
//           // PersistentBottomNavBarItem(
//           //     icon: Icon(Icons.card_travel_outlined),
//           //     title: ("Travel"),
//           //     activeColorPrimary: appColors.textBlueColor,
//           //     inactiveColorPrimary: Colors.grey),
//           PersistentBottomNavBarItem(
//               icon: Icon(Icons.notifications),
//               title: ("Message"),
//               activeColorPrimary: appColors.textBlueColor,
//               inactiveColorPrimary: Colors.grey),
      
//         ],
//         navBarStyle: NavBarStyle.style6,
//         // selectedIndex: _selectedIndex,
//         backgroundColor: appColors.textPrimaryColor, // Set background color
//         // iconSize: 26.0,
//         // height: 60.0, // Set height
//         itemAnimationProperties: ItemAnimationProperties(
//           duration: Duration(milliseconds: 200),
//           curve: Curves.easeInCirc,
//         ),
//         onItemSelected: (index) {
//           setState(() {
//           });
//         },
//         screens: [
//         Dashboard(),
//         SearchUserPage(),
//         // Dashboard(),
//        TripView(),
//        MessageView(),
         
//         ],
      
//     );
//   }

// }





import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/Dashboard/home.dart';
import 'package:meettown/view/SearchUser/Search_user.dart';
import 'package:meettown/view/Trip_view/trip_view.dart';
import 'package:meettown/view/message_view/message_view.dart';

class CustomNavbar extends StatefulWidget {
  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _selectedIndex = 0;
  static  List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    SearchUserPage(),
    TripView(),
    MessageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_active),
              label: 'Trips',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Message',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: appColors.textBlueColor,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

