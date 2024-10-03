import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/profile_view/own_trip_view/own_upcoming_trips/own_upcoming_trips.dart';
import 'package:meettown/view/profile_view/own_trip_view/preferences_view/preferences_view.dart';

class OwnTripView extends StatelessWidget {
  const OwnTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Container(
                height: 60,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: appColors.textBlueColor,
                    labelStyle: TextStyle(
                        color: appColors.textBlueColor,
                        fontWeight: FontWeight.bold),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                      child: Row(children: [
                        FaIcon(FontAwesomeIcons.bus,color:Colors.red),
                        Text('Upcoming Trips')
                      ],),
                      ),
                      Tab(
                      child: Row(children: [
                        FaIcon(FontAwesomeIcons.route,color: Colors.red,),
                        // Icon(Icons.swa)
                        Text('Pass Trips')
                      ],),
                      ),
                      Tab(
                       child: Row(children: [
                        FaIcon(FontAwesomeIcons.planeDeparture,color: Colors.lightBlue,),
                        Text('Preferences')
                      ],),
                      ),
                    
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: TabBarView(children: [
                OwnUpComingTrips(),
                Center(child: Text('No Available')),
                PreferenceView(),
              ]))
            ],
          ),
    );
  }
}