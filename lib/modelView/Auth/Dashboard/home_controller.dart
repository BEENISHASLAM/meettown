import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meettown/res/global.dart';
import 'package:http/http.dart' as http;
import 'package:meettown/res/shard_preferences.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeController extends GetxController {
  final SharedPreference prefs = SharedPreference();
  File? imageFile;
  var loading = false;
  var _currentAddress;
  var postData = [];
  var userPostUpdate = [];
  final TextEditingController postController = TextEditingController();

  setLoading(val) {
    loading = val;
    update();
  }

  setPost(val, postUser) {
    userPostUpdate = postUser;
    postData = val;
    update();
  }

  Future<void> getPostWithEarliestTimestamp() async {
    //   DatabaseReference ref = FirebaseDatabase.instance.ref("posts");

    // DataSnapshot snapshot = await ref.get();
    // if (snapshot.value != null) {
    //     Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
    //   List<dynamic> values = data.values.toList();
    //   print(values);
    //   var postUserSet = <String>{}; // Set to store user IDs
    // var postUserList = []; // List to store filtered posts

    // for (var i = 0; i < values.length; i++) {
    //   if (!postUserSet.contains(values[i]['userId'])) {
    //     postUserSet.add(values[i]['userId']); // Add userId to the set
    //     postUserList.add(values[i]); // Add post to the list
    //   }
    // }
    //   print(postUserList);

    //   setPost(values,postUserList);

    // } else {
    //   print('No data available.');
    // }
    // setPost(event.value);
  }

  Future<void> uploadPost(context, String text, File? imageFile) async {
    var res = await getCurrentLocation();
    Navigator.of(context).pop();

    String imageUrl = '';
    if (imageFile != null) {
      final storageRef = FirebaseStorage.instance.ref().child('posts/${DateTime.now().toIso8601String()}');
      final uploadTask = storageRef.putFile(imageFile);
      final snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
    }

    DatabaseReference databaseReference = FirebaseDatabase.instance.ref('posts');
    var ref = databaseReference.push();
    await ref.set({
      "userId": UserId,
      "username": UserName,
      'text': text,
      'postImage': imageUrl,
      "userImage": image,
      "address": "USA",
      'timestamp': DateTime.now().toIso8601String(),
      "like": 0,
      "comments": 0,
      "postId": ref.key
    });

    // DatabaseReference databaseReference1 = FirebaseDatabase.instance.ref("users").child('posts');
    // await databaseReference1.push().set({
    //    "userId":UserId,
    //   "username":"name",
    //   "address":"USA",
    //   'text': text,
    //   'imageUrl': imageUrl,
    //   'timestamp': DateTime.now().toIso8601String(),
    //   "like":0,
    //   "comments":0
    // });
    Get.snackbar(
      "Success",
      "Post created successfully", // Display the error message
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
    );
    setLoading(false);
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      _currentAddress = "${place.locality}, ${place.country}";
      update();
      return _currentAddress;
    } catch (e) {
      print(e);
    }
  }

  Future<void> showUploadDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Post'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: postController,
                  decoration: InputDecoration(hintText: 'Share your moment...'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      imageFile = File(pickedFile.path);
                      update();
                    }
                  },
                  child: Text('Upload Image'),
                ),
                imageFile != null ? Image.file(imageFile!) : Container(),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Post'),
              onPressed: () async {
                if (postController.text.isNotEmpty || imageFile != null) {
                  setLoading(true);
                  // await uploadPost(context, postController.text, imageFile);
                  await uploadPostNew(context, postController.text, imageFile);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> uploadPostNew(BuildContext context, String? text, File? imageFile) async {
    final token = await prefs.getToken();
    print(token);

    var headers = {'token': '$token'};

    var request = http.MultipartRequest('POST', Uri.parse('https://meet-town-3f191b8f46d2.herokuapp.com/api/post/create-post'));

    // Validate that text is not null or empty

    // Add text to the request
    request.fields['title'] = text!;

    // Only add the image file if it's not null
    if (imageFile != null) {
      request.files.add(await http.MultipartFile.fromPath('postMedia', imageFile.path));
    } else {
      print("No image file provided.");
    }

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print('Response Body: $responseBody');
        final Map<String, dynamic> responseData = jsonDecode(responseBody);
        if (responseData['status'] == true && responseData['data'] != null) {
          String id = responseData['data']['_id'];
          String message = responseData['message'];
          print('Post ID: $id');
          print(message);
          await saveID(id);
          Get.snackbar(
            "Success",
            ": $message",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
          );
        } else {
          print('Response data does not contain ID');
        }
      } else {
        print('Failed to upload post: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error occurred while uploading: $e');
    } finally {
      setLoading(false);
    }
  }

  Future<void> saveID(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
  }
}
