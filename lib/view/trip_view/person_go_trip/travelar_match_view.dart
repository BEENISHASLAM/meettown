import 'package:flutter/material.dart';
import 'package:meettown/res/components/travelar_cart.dart';
import 'package:meettown/view/profile_view/profile_view.dart';

class TravelarMAtchView extends StatelessWidget {
  const TravelarMAtchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
             Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfileView(
                    name: "New Traveler",
                  )));
          },
          child: TravelarView(
            name: 'name',
            image:
                'https://cdn.pixabay.com/photo/2023/07/04/19/43/man-8106958_1280.png',
            flagImage:
                'https://cdn.pixabay.com/photo/2017/03/14/21/00/american-flag-2144392_1280.png',
            duration: '2023-4-03  2025-04-03',
            tranportType: 'Train',
            tranportTypeIcon: Icons.train,
            tranportWith: 'Other',
            tranportWithIcons: Icons.house,
            vocation: 'Vocation',
            vocationIcons: Icons.business_center,
            countryName: 'Louisiana',
            level: '26',
          ),
        );
      },
    );
  }
}