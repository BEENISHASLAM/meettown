import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meettown/res/components/custom_appbar.dart';
import 'package:meettown/res/components/trip_fliter_bottom_sheet.dart';
import 'package:meettown/view/SearchUser/search_view/current_location_view/current_location_view.dart';
import 'package:meettown/view/trip_view/person_go_trip/persons_go_trip.dart';
import 'package:meettown/view/trip_view/trip_time_view/trip_time_view.dart';

class TripView extends StatelessWidget {
  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: CustomAppBar(
              title: 'Trips',
            )),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
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
                            icon: Icon(
                              Icons.directions_walk_outlined,
                              size: 30,
                            ),
                          ),
                          Tab(
                            icon: Icon(
                              Icons.airplane_ticket,
                              color: Colors.lightBlue,
                              size: 30,
                            ),
                          ),
                          Tab(
                            icon: Icon(
                              Icons.shopping_bag,
                              color: Colors.lightGreen,
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
                ),
                IconButton(
                  onPressed: (){
                     showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                // Return your bottom sheet widget here
                return TripFilterBottomSheet();
              },
            );
                  },
                  
                  icon: Icon(Icons.tune,size: 30,color: Colors.black,
              ))
              ],
            ),

            Expanded(child: TabBarView(children: [
              PersonsGoTrip(),
             TripTimeView(),
              Center(child: Text('No Available'),),
CurrentLocationView(),
            ],)
            
            )
          ],
        ),
      ),
    );
  }
}
