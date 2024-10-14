import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meettown/model/login_model.dart';
import 'package:meettown/modelView/api_url/api_url.dart';
import 'package:meettown/res/global.dart';
import 'package:meettown/res/shard_preferences.dart';
import 'package:meettown/view/Dashboard/home.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

import '../../view/BottomNavbar/BottomNavbar.dart';

class CompletedProfileController extends ChangeNotifier {
  //store data
  double? latitude;
  double? longitude;
  late File? newImage;
  List<String> selectedInterests = [];

  late File _image;
  var loading = false;
  File get image => _image;

  final List<String> interests = [
    'Technology',
    'Music',
    'Sports',
    'Reading',
    'Traveling',
    'Movies',
    'Cooking',
    'Fitness',
    'Software Development',
    'Graphic Design',
    'Data Science',
    'Project Management',
    'Marketing',
    'Business Analysis',
    'Networking',
    'Artificial Intelligence',
    'UI/UX Design',
    'Cybersecurity',
    'Cloud Computing',
    'Digital Marketing',
    'Entrepreneurship',
    'Public Speaking',
    'Leadership',
    'Financial Planning',
    'Human Resources',
    'Accounting',
    'Law',
    'Content Writing',
    'Photography',
    'Consulting',
    'Education & Teaching',
  ];
  List<String> educationOptions = [
    'No formal education',
    'Primary education',
    'Secondary education',
    'Vocational qualification',
    'Bachelor\'s degree',
    'Master\'s degree',
    'Doctorate or higher',
    'Other',
  ];

  List<String> LookingFor = [
    'Serious Relationship',
    'Friendship',
    'Casual Dating',
    'Timepass',
    'Marriage',
    'Networking',
    'Travel Partner',
    'Activity Partner',
    'Hookup',
    'Open Relationship',
    'Flirting',
    'Professional Connections'
  ];

  List<String> heightOptions = [
    'Below 4 feet',
    '4 feet 0 inches',
    '4 feet 1 inch',
    '4 feet 2 inches',
    '4 feet 3 inches',
    '4 feet 4 inches',
    '4 feet 5 inches',
    '4 feet 6 inches',
    '4 feet 7 inches',
    '4 feet 8 inches',
    '4 feet 9 inches',
    '4 feet 10 inches',
    '4 feet 11 inches',
    '5 feet 0 inches',
    // Add more options as needed
  ];

  List<String> bodyOptions = [
    'Slim',
    'Athletic',
    'Average',
    'Curvy',
    'Muscular',
    'Overweight',
    'Obese',
    'Other',
  ];

  List<String> childrenOptions = [
    'None',
    '1',
    '2',
    '3',
    '4',
    '5 or more',
    'Prefer not to say',
  ];

  List<String> relationshipOptions = [
    'Single',
    'In a relationship',
    'Engaged',
    'Married',
    'Separated',
    'Divorced',
    'Widowed',
    'Complicated',
    'Other',
  ];

  List<String> nationalityOptions = [
    'Afghan',
    'Albanian',
    'Algerian',
    'American',
    'Andorran',
    'Angolan',
    'Antiguans',
    'Argentinean',
    'Armenian',
    'Australian',
    'Austrian',
    'Azerbaijani',
    'Bahamian',
    'Bahraini',
    'Bangladeshi',
    'Barbadian',
    'Barbudans',
    'Batswana',
    'Belarusian',
    'Belgian',
    'Belizean',
    'Beninese',
    'Bhutanese',
    'Bolivian',
    'Bosnian',
    'Brazilian',
    'British',
    'Bruneian',
    'Bulgarian',
    'Burkinabe',
    'Burmese',
    'Burundian',
    'Cambodian',
    'Cameroonian',
    'Canadian',
    'Cape Verdean',
    'Central African',
    'Chadian',
    'Chilean',
    'Chinese',
    'Colombian',
    'Comoran',
    'Congolese',
    'Costa Rican',
    'Croatian',
    'Cuban',
    'Cypriot',
    'Czech',
    'Danish',
    'Djibouti',
    'Dominican',
    'Dutch',
    'East Timorese',
    'Ecuadorean',
    'Egyptian',
    'Emirian',
    'Equatorial Guinean',
    'Eritrean',
    'Estonian',
    'Ethiopian',
    'Fijian',
    'Filipino',
    'Finnish',
    'French',
    'Gabonese',
    'Gambian',
    'Georgian',
    'German',
    'Ghanaian',
    'Greek',
    'Grenadian',
    'Guatemalan',
    'Guinea-Bissauan',
    'Guinean',
    'Guyanese',
    'Haitian',
    'Herzegovinian',
    'Honduran',
    'Hungarian',
    'I-Kiribati',
    'Icelander',
    'Indian',
    'Indonesian',
    'Iranian',
    'Iraqi',
    'Irish',
    'Israeli',
    'Italian',
    'Ivorian',
    'Jamaican',
    'Japanese',
    'Jordanian',
    'Kazakhstani',
    'Kenyan',
    'Kittian and Nevisian',
    'Kuwaiti',
    'Kyrgyz',
    'Laotian',
    'Latvian',
    'Lebanese',
    'Liberian',
    'Libyan',
    'Liechtensteiner',
    'Lithuanian',
    'Luxembourger',
    'Macedonian',
    'Malagasy',
    'Malawian',
    'Malaysian',
    'Maldivan',
    'Malian',
    'Maltese',
    'Marshallese',
    'Mauritanian',
    'Mauritian',
    'Mexican',
    'Micronesian',
    'Moldovan',
    'Monacan',
    'Mongolian',
    'Moroccan',
    'Mosotho',
    'Motswana',
    'Mozambican',
    'Namibian',
    'Nauruan',
    'Nepalese',
    'New Zealander',
    'Nicaraguan',
    'Nigerian',
    'Nigerien',
    'North Korean',
    'Northern Irish',
    'Norwegian',
    'Omani',
    'Pakistani',
    'Palauan',
    'Panamanian',
    'Papua New Guinean',
    'Paraguayan',
    'Peruvian',
    'Polish',
    'Portuguese',
    'Qatari',
    'Romanian',
    'Russian',
    'Rwandan',
    'Saint Lucian',
    'Salvadoran',
    'Samoan',
    'San Marinese',
    'Sao Tomean',
    'Saudi',
    'Scottish',
    'Senegalese',
    'Serbian',
    'Seychellois',
    'Sierra Leonean',
    'Singaporean',
    'Slovakian',
    'Slovenian',
    'Solomon Islander',
    'Somali',
    'South African',
    'South Korean',
    'Spanish',
    'Sri Lankan',
    'Sudanese',
    'Surinamer',
    'Swazi',
    'Swedish',
    'Swiss',
    'Syrian',
    'Taiwanese',
    'Tajik',
    'Tanzanian',
    'Thai',
    'Togolese',
    'Tongan',
    'Trinidadian or Tobagonian',
    'Tunisian',
    'Turkish',
    'Tuvaluan',
    'Ugandan',
    'Ukrainian',
    'Uruguayan',
    'Uzbekistani',
    'Venezuelan',
    'Vietnamese',
    'Welsh',
    'Yemenite',
    'Zambian',
    'Zimbabwean',
  ];

  List<String> languageOptions = [
    'English',
    'Urdu',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
    'Arabic',
    'Russian',
    'Italian',
    'Portuguese',
    'Hindi',
    'Bengali',
    'Punjabi',
    'Telugu',
    'Marathi',
    'Tamil',
    'Turkish',
    'Korean',
    'Vietnamese',
    'Polish',
    'Ukrainian',
    'Thai',
    'Romanian',
    'Greek',
    'Dutch',
    'Hungarian',
    'Czech',
    'Swedish',
    'Danish',
    'Finnish',
    'Norwegian',
    'Indonesian',
    'Malay',
    'Filipino',
    'Slovak',
    'Bulgarian',
    'Croatian',
    'Serbian',
    'Slovenian',
    'Lithuanian',
    'Estonian',
    'Latvian',
    'Georgian',
    'Farsi',
    'Hebrew',
    'Maltese',
    'Icelandic',
    'Welsh',
    'Irish',
    'Basque',
    'Catalan',
    'Galician',
    'Scots Gaelic',
  ];

  List<String> professionOptions = [
    'Engineer',
    'Doctor',
    'Teacher',
    'Artist',
    'Lawyer',
    'Chef',
    'Software Developer',
    'Accountant',
    'Architect',
    'Designer',
    'Writer',
    'Musician',
    'Actor',
    'Entrepreneur',
    'Photographer',
    'Scientist',
    'Dentist',
    'Nurse',
    'Psychologist',
    'Police Officer',
    'Firefighter',
    'Pilot',
    'Journalist',
    'Athlete',
    'Electrician',
    'Mechanic',
    'Plumber',
    'Carpenter',
    'Farmer',
    'Salesperson',
    'Marketing Specialist',
    'Consultant',
    'Real Estate Agent',
    'Financial Advisor',
    'HR Manager',
    'Social Worker',
    'Translator',
    'Librarian',
    'Veterinarian',
    'Fitness Trainer',
    'Pharmacist',
    'Biologist',
    'Geologist',
    'Surveyor',
    'Professor',
    'Economist',
    'Law Enforcement Officer',
    'Graphic Designer',
    'Interior Designer',
    'Web Developer',
    'Data Analyst',
    'Project Manager',
    'Fashion Designer',
    'Event Planner',
  ];

  void setImage(File image) {
    _image = image;
    notifyListeners();
  }

  setLoading(val) {
    loading = val;
    notifyListeners();
  }

  Future<String?> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> createProfile(context, language, profession, nationalalty,
      relationship, education, lookingFor) async {
    setLoading(true);
    final token = await _getToken();
    var headers = {'token': '$token'};
    print("beenish");
    print(newImage!.path);
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiUrl.baseUrl}auth/create-profile'));

    request.fields['language'] = language;
    request.fields['professional'] = profession;
    request.fields['nationality'] = nationalalty;
    request.fields['relationShip'] = relationship;
    request.fields['education'] = education;
    request.fields['longitude'] = longitude.toString();
    request.fields['latitude'] = latitude.toString();
    request.fields['lookingFor'] = lookingFor;

    for (var i = 0; i < selectedInterests.length; i++) {
      request.fields['interests[${i}]'] = selectedInterests[i];
    }

    // Send the interests as multiple fields

    request.files
        .add(await http.MultipartFile.fromPath('profileImage', newImage!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print(response.statusCode);
      setLoading(false);
      Get.snackbar("Success", " Profile created  Successfully");

      //  final responseData = jsonDecode(response.body);

      //   SharedPreference().SetToken(responseData["data"]["token"]);
      //   // Convert the response to LoginResponse
      //   LoginResponse loginResponse = LoginResponse.fromJson(responseData);

      //  UserId=responseData["data"]["UserData"]["_id"];
      // UserName=responseData["data"]["UserData"]["firstName"];
      // image=responseData["data"]["UserData"]["profileId"]["profileImage"]["file"];

      Get.offAll(CustomNavbar());

      //  Navigator.push(context, MaterialPageRoute(builder: (_) => CustomNavbar()));
    } else {
      print(await response.stream.bytesToString());
      print(response.reasonPhrase);
    }
    setLoading(false);
  }

  //this is for location
  setLocation(lat, long) {
    print(long);
  }

  setLatLong(context, lat, long) {
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

  storeOtherInfoDb(context, language, profession, nationalalty, relationship,
      education) async {
    print(language);
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    setLoading(true);

    var res = await databaseReference.child('users').child(UserId).update({
      "langauge": language,
      "profession": profession,
      "nationalalty": nationalalty,
      "relationship": relationship,
      "education": education
    });
    setLoading(false);

    Get.snackbar("Success", "Update Profile  Successfully");

    // Navigator.push(context,MaterialPageRoute(builder: (context) => Dashboard()));
    Get.offAll(Dashboard());
  }

  getProfileImage(context, image) async {
    print(image);
  }

  StoreImageDb(context, _image) {
    var res = uploadFile(_image);
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
