import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/components/image_name_profile.dart';
import 'package:provider/provider.dart';

import '../../../res/user_profile.dart';

// class AboutView extends StatelessWidget {
//   const AboutView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 FaIcon(
//                   FontAwesomeIcons.idCard,
//                   color: Colors.red,
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   "About Me",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: 
// 
// 
// ),
//                 ),
//                 Spacer(),
//                 Icon(
//                   FontAwesomeIcons.penToSquare,
//                   color: appColors.textBlueColor,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             Row(
//               children: [
//                 Image.asset(
//                   'assets/imgs/eye.png',
//                   width: 30,
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Text(
//                   "I am looking for",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: appColors.textBlueColor),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ImageNameProfile(
//                     image:
//                         'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea',
//                     name: 'name'),
//                 ImageNameProfile(
//                     image:
//                         'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea',
//                     name: 'name'),
//                 ImageNameProfile(
//                     image:
//                         'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea',
//                     name: 'name'),
//                 ImageNameProfile(
//                     image:
//                         'https://img.freepik.com/free-photo/close-up-portrait-young-bearded-man-white-shirt-jacket-posing-camera-with-broad-smile-isolated-gray_171337-629.jpg?w=740&t=st=1711728845~exp=1711729445~hmac=8a31cb14bbd1a4eef800fc22ceb7263b07a8e4aa5b323f135ebcfe20131682ea',
//                     name: 'name'),
//               ],
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             Row(
//               children: [
//                 FaIcon(
//                   FontAwesomeIcons.passport,
//                   color: Colors.red,
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   "About Me",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: appColors.textBlueColor),
//                 ),
//                 Spacer(),
//                 Icon(
//                   FontAwesomeIcons.penToSquare,
//                   color: appColors.textBlueColor,
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
        
//                   children: [
//                     SimpleBoldText(title: 'Gender',color: Colors.black,),
//                     SimpleText(title: 'Male',color: Colors.grey,),
//                     SimpleBoldText(title: 'Profession',color: Colors.black,),
//                     SimpleText(title: 'Sales Executive',color: Colors.grey,),
//                     SimpleBoldText(title: 'Education',color: Colors.black,),
//                     SimpleText(title: 'Post Graduate',color: Colors.grey,),
//                     SimpleBoldText(title: 'Body',color: Colors.black,),
//                     SimpleText(title: 'Slim',color: Colors.grey,),
                    
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SimpleBoldText(title: 'Relationship Status',color: Colors.black,),
//                     SimpleText(title: 'Single',color: Colors.grey,),
//                     SimpleBoldText(title: 'I Speak',color: Colors.black,),
//                     SimpleText(title: 'French English',color: Colors.grey,),
//                     SimpleBoldText(title: 'Height',color: Colors.black,),
//                     SimpleText(title: "175 cm (5'9)",color: Colors.grey,),
//                     SimpleBoldText(title: 'children',color: Colors.black,),
//                     SimpleText(title: 'already have kids',color: Colors.grey,),
                    
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context);
    final loginResponse = userDataProvider.loginResponse;

    return SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'About Us',
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            SizedBox(height: 8),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
                     Divider(color: Color.fromARGB(255, 208, 205, 205),height: 20),

            Card(
              elevation: 1,
              // shadowColor: Colors.white,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.95,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'I Am Looking For',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       Row(
                children: [
                  CircleAvatar(
                    backgroundColor: appColors.textBlueColor,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.group, size: 40, color: Colors.white),
                    )),
                  SizedBox(width: 8),
                  Text(
                    'Socialising',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
           
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                    color: appColors.textBlueColor,
                    border: Border.all(color: const Color.fromARGB(255, 152, 152, 152),width: 3,),
                    borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'In My Passport',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xfff1f7f7),
                    child: 
                    Column(
                      children: [
                          Divider(color: Colors.white),
  buildPassportDetail('Gender','Male' ),
                  buildPassportDetail('Relationship Status', 'Married'),
                  buildPassportDetail('Profession', 'Software Engineer'),
                  buildPassportDetail('I Speak', 'English'),
                  buildPassportDetail('Education', 'Bachelor'),
                  buildPassportDetail('Height', '5\'8"'),
                  buildPassportDetail('Body', '-'),
                  buildPassportDetail('Children', '2'),
                      ],
                    )
                  
                  
                    ),
                
                ],
              ),
            ),
            SizedBox(height: 20,),
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interests',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: appColors.textBlueColor,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0, // Horizontal spacing
              runSpacing: 4.0, // Vertical spacing
              children: [
                Chip(
                  label: Text('Hiking'),
                  backgroundColor: Colors.pink,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Adventure'),
                  backgroundColor: Colors.orange,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Travelling'),
                  backgroundColor: Colors.blue,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Mountain'),
                  backgroundColor: Colors.green,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Hill Station'),
                  backgroundColor: Colors.purple,
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
          ],
        ),
      
    );
  }

  Widget buildPassportDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 117, 116, 116),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color:appColors.textBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
// ignore: must_be_immutable
class SimpleBoldText extends StatelessWidget {
  String title;
  Color color;
   SimpleBoldText({
    super.key,
    required this.title,
    required this.color,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: color),
    );
  }
}
// ignore: must_be_immutable
class SimpleText extends StatelessWidget {
  String title;
  Color color;
   SimpleText({
    super.key,
    required this.title,
    required this.color,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16, color: color),
    );
  }
}
