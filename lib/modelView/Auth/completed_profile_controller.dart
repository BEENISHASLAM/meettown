import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/res/global.dart';
import 'package:meettown/view/Dashboard/home.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

import '../../view/BottomNavbar/BottomNavbar.dart';



class CompletedProfileController extends ChangeNotifier {
  //store data
double? latitude;
double? longitude;
late File?  newImage;

  late File _image;
  var loading = false;
  File get image => _image;

  void setImage(File image) {
    _image = image;
    notifyListeners();
  }

  setLoading(val){
    loading=val;
    notifyListeners();

  }



  Future<String?> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

   Future<void> createProfile(context,language,profession,nationalalty,relationship,education) async {
   setLoading(true);
     final token = await _getToken();
     var headers = {
       'token': '$token'
     };
     print("beenish");
     print(newImage!.path);
     var request = http.MultipartRequest('POST', Uri.parse('https://meet-town-3f191b8f46d2.herokuapp.com/api/auth/create-profile'));
     request.fields.addAll({
       'language':language,
       'professional':profession,
       'nationality': nationalalty,
       'relationShip':relationship,
       'education': education,
       'longitude':longitude.toString(),
       'latitude':latitude.toString(),
     });
     request.files.add(await http.MultipartFile.fromPath('profileImage',newImage!.path));
     request.headers.addAll(headers);

     http.StreamedResponse response = await request.send();
     if (response.statusCode == 200) {
       print(await response.stream.bytesToString());
       print(response.statusCode);
       setLoading(false);
       Get.snackbar("Success", " Profile created  Successfully");

      // Get.offAll(Dashboard());

         Navigator.push(context, MaterialPageRoute(builder: (_) => CustomNavbar()));


     }
     else {
       print(response.reasonPhrase);
     }
   setLoading(false);

  }


  //this is for location
  setLocation(lat, long){
    print(long);

  }
  setLatLong(context,lat,long)  {
   
    //   DatabaseReference databaseReference =
    //       FirebaseDatabase.instance.reference();
    // var res = await  databaseReference.child('users').child(UserId).update({
    //    "Latitude":lat,
    //    "Longitude":long
    //   });
    //
    //
    //   Get.snackbar("Success", "Location Store Successfully");
    // Navigator.push(context,MaterialPageRoute(builder: (context) => PassportPage()));


  }

  storeOtherInfoDb(context,language,profession,nationalalty,relationship,education) async {
    print(language);
     DatabaseReference databaseReference =
          FirebaseDatabase.instance.reference();
      setLoading(true);

    var res = await  databaseReference.child('users').child(UserId).update({
 "langauge" : language,
 "profession":profession,
 "nationalalty":nationalalty,
 "relationship":relationship,
 "education":education
      });
         setLoading(false);

       
      Get.snackbar("Success", "Update Profile  Successfully");
   
    // Navigator.push(context,MaterialPageRoute(builder: (context) => Dashboard()));
    Get.offAll(Dashboard());

  }

  getProfileImage(context,image) async{
    print(image);
  }
  StoreImageDb(context,_image) {
    var res =  uploadFile(_image);
    // try {
    //   DatabaseReference databaseReference =
    //       FirebaseDatabase.instance.reference();
    //    databaseReference.child('users').child(UserId).update({
    //     "Image": res,
    //   });
    //   Get.snackbar("Success", "Store Image Successfully");
    //     Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => SetLoctationScreen()));
    // } catch (e) {
    //   Get.snackbar("Error", e.toString());
    // }
  }

  Future<String> uploadFile(File file) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageReference = storage.ref().child('uploads/${file.path}');
    UploadTask uploadTask = storageReference.putFile(file);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

void login(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => CustomNavbar()));
}

}



