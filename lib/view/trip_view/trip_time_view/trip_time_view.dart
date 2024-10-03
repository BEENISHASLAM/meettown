import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/trip_view/trip_time_view/pass_trip_view/pass_trip_view.dart';
import 'package:meettown/view/trip_view/trip_time_view/travel_this_month/travel_this_month.dart';
import 'package:meettown/view/trip_view/trip_time_view/upcomming_trip_view/upcomming_trip_view.dart';

class TripTimeView extends StatelessWidget {
  const TripTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
       
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: appColors.textBlueColor,
                  indicatorPadding: EdgeInsets.all(0),
                  tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    labelStyle: TextStyle(
                        color: appColors.textBlueColor,
                        fontWeight: FontWeight.bold),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: 'Travel this month',
                      ),
                      Tab(
                        text: 'Upcomming trip',
                      ),
                      Tab(
                        text: 'Pass trip',
                      ),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: TabBarView(children: [
                TravelThisMonth(),
                UpCommingTrip(),
                PassTripView(),
                
              ]))
            ],
          ),
        ),
      ),
    );
  }
}