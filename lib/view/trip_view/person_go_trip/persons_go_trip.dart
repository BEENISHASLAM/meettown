import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/view/trip_view/person_go_trip/travelar_match_view.dart';
import 'package:meettown/view/trip_view/person_go_trip/travelars_view.dart';

class PersonsGoTrip extends StatelessWidget {
  const PersonsGoTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Container(
                height: 60,
                child: TabBar(
                  
                    indicatorColor: appColors.textBlueColor,
                    labelStyle: TextStyle(
                        color: appColors.textBlueColor,
                        fontWeight: FontWeight.bold),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: 'Travelers',
                      ),
                      Tab(
                        text: 'Travel Match',
                      ),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: TabBarView(children: [
                TravelarsView(),
                TravelarMAtchView(),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}