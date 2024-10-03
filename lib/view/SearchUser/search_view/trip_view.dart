import 'package:flutter/material.dart';
import 'package:meettown/res/components/filter_view.dart';
import 'package:meettown/res/components/post_cart.dart';

class TripSearchView extends StatelessWidget {
  const TripSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
             Padding(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                child: Text(
                  'Locals',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 232, 232, 232),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
      
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return FilterView();
                            });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Filter',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.tune,
                            color: Colors.black,
                            size: 30,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
       ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return PostCart(name: 'Gab', distance: '300KM', gender: 'Male', image: 'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea', location: 'Paris,France', onCommentTap: (){}, onHeartTap: (){});
          },
        ),
        ],
      
      ),
    );
  }
}