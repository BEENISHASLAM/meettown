import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meettown/modelView/Filter/trip_filter_controller.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/components/custom_button.dart';
import 'package:meettown/res/components/image_name.dart';
import 'package:provider/provider.dart';

import '../../view/Auth/SelectImage.dart';

class TripFilterBottomSheet extends StatelessWidget {
  const TripFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    File? _image;
    final picker = ImagePicker();
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ContactModel>(
          builder: (context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add New Trip',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: appColors.textBlueColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Meet other singles travellers/local during you trip. Share you trip with the other member',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: value.location,
                decoration: InputDecoration(
                  labelText: 'Enter a location',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2),borderRadius: BorderRadius.circular(40))
                ),
                // onChanged: (val) {
                //    value.location = val;
                // },
              ),
              SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: value.startDate,
                          decoration: InputDecoration(
                            labelText: 'Start Date',
                             labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2),borderRadius: BorderRadius.circular(40))
                          ),
                          // onChanged: (val) {

                          //    value.startDate = DateTime.parse(val);

                          // },
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: TextField(
                          controller: value.endDate,
                          decoration: InputDecoration(
                            labelText: 'End Date',
                             labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 2),borderRadius: BorderRadius.circular(40))
                          ),
                          // onChanged: (val) {
                          //     value.endDate = DateTime.parse(val);
                          // },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Travel mode',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: appColors.textBlueColor),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: 'air',
                          groupValue: value.travelMode,
                          onChanged: (val) {
                            // value.travelMode = val.toString();
                            value.setTravelMode(val.toString());
                          },
                        ),
                        Text('Air'),
                        Spacer(),
                        Radio(
                          value: 'train',
                          groupValue: value.travelMode,
                          onChanged: (val) {
                            // value.travelMode = val.toString();
                            value.setTravelMode(val.toString());

                          },
                        ),
                        Text('Train'),
                        Spacer(),
                        Radio(
                          value: 'car',
                          groupValue: value.travelMode,
                          onChanged: (val) {
                            // value.travelMode = val.toString();
                            value.setTravelMode(val.toString());

                          },
                        ),
                        Text('Car'),
                      ],
                    ),
                  ),
                  Text(
                    'You Stay',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: appColors.textBlueColor),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: 'other',
                          groupValue: value.youStay,
                          onChanged: (val) {
                            // value.youStay = val.toString();
                            value.setYouStay(val.toString());

                          },
                        ),
                        Text('other'),
                        Spacer(),
                        Radio(
                          value: 'hotel',
                          groupValue: value.youStay,
                          onChanged: (val) {
                                                       value.setYouStay(val.toString());

                          },
                        ),
                        Text('hotel'),
                        Spacer(),
                        Radio(
                          value: 'friend',
                          groupValue: value.youStay,
                          onChanged: (val) {
                                                       value.setYouStay(val.toString());

                          },
                        ),
                        Text('friend'),
                      ],
                    ),
                  ),
                  Text(
                    'You Stay',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: appColors.textBlueColor),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: 'business',
                          groupValue: value.travelFor,
                          onChanged: (val) {
                            // value.travelFor = val.toString();
                            value.setTravelFor(val.toString());

                          },
                        ),
                        Text('Business'),
                        Spacer(),
                        Radio(
                          value: 'vocation',
                          groupValue: value.travelFor,
                          onChanged: (val) {
                            // value.travelFor = val.toString();
                            value.setTravelFor(val.toString());

                          },
                        ),
                        Text('Vocation'),
                        Spacer(),
                        Radio(
                          value: 'both',
                          groupValue: value.travelFor,
                          onChanged: (val) {
                            // value.travelFor = val.toString();
                            value.setTravelFor(val.toString());

                          },
                        ),
                        Text('Both'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 200, // Provide a fixed width to the container
                            child: Stack(
                              children: [
                                Container(
                                  width: 200, // Same width as the container
                                  height: 200,
                                  child: _image == null
                                      ? Image(
                                    image: NetworkImage(
                                      "https://static.vecteezy.com/system/resources/previews/019/879/198/original/user-icon-on-transparent-background-free-png.png",
                                    ),
                                    width: 100,
                                    height: 100,
                                  )
                                      : CircleAvatar(
                                    backgroundImage: FileImage(_image),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.5,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  right: -10,
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      // _showSourceDialog();
                                    },
                                    elevation: 10.0,
                                    fillColor: Color.fromARGB(255, 25, 106, 172),
                                    child: Icon(Icons.camera_alt_outlined, color: const Color.fromARGB(255, 242, 243, 244)),
                                    padding: EdgeInsets.all(2),
                                    shape: CircleBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              height: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  CustomButtonWidget(
                                      title: 'Next',
                                      foregroundColor: appColors.iconPrimaryColor,
                                      bgColor: appColors.textBlueColor,
                                      selectedFgButtonColor: appColors.iconPrimaryColor,
                                      onpress: () {
                                        if(_image == null){
                                          Get.snackbar("Error", "Select Profile Image");
                                        }
                                        else{

                                          // completeProfile.StoreImageDb(context,_image);
                                          // completeProfile.getProfileImage(context,_image);
                                          // completeProfile.newImage = _image;
                                          print("image  nnf?///");


                                         // Navigator.push(context, MaterialPageRoute(builder: (context) => SetLoctationScreen()));
                                        }

                                        //
                                      }),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ],

                // children: [
                //   ImageName(
                //       image:
                //           'https://cdn.pixabay.com/photo/2023/07/04/19/43/man-8106958_1280.png',
                //       name: 'name'),
                //   ImageName(
                //       image:
                //           'https://cdn.pixabay.com/photo/2023/07/04/19/43/man-8106958_1280.png',
                //       name: 'name'),
                //   ImageName(
                //       image:
                //           'https://cdn.pixabay.com/photo/2023/07/04/19/43/man-8106958_1280.png',
                //       name: 'name'),
                //   ImageName(
                //       image:
                //           'https://cdn.pixabay.com/photo/2023/07/04/19/43/man-8106958_1280.png',
                //       name: 'name'),
                // ],
              ),
              SizedBox(height: 16.0),
              CustomButton(
                title: 'Add Trip',
                onTap: () {
                  value.addTrip();
                },
              )
            ],
          ),
        ),
      );
  }
}