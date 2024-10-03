class GetUserByMatch {
  bool? success;
  String? message;
  List<Data>? data;

  GetUserByMatch({this.success, this.message, this.data});

  GetUserByMatch.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['success'] = this.success;
    dataMap['message'] = this.message;
    if (this.data != null) {
      dataMap['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return dataMap;
  }
}

class Data {
  UserData? userData;
  AuthId? user;
  String? distanceKm;

  Data({this.userData, this.user, this.distanceKm});

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['userData'] != null ? UserData.fromJson(json['userData']) : null;
    user = json['user'] != null ? AuthId.fromJson(json['user']) : null;
    distanceKm = json['distanceKm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    if (this.userData != null) {
      dataMap['userData'] = this.userData!.toJson();
    }
    if (this.user != null) {
      dataMap['user'] = this.user!.toJson();
    }
    dataMap['distanceKm'] = this.distanceKm;
    return dataMap;
  }
}

class UserData {
  String? sId;
  String? language;
  String? professional;
  String? nationality;
  String? education;
  Location? location;
  AuthId? authId;
  ProfileImage? profileImage;
  String? address;
  List<dynamic>? post; // Changed from List<Null> to List<dynamic>
  String? createdAt;
  String? updatedAt;
  List<String>? interests;
  int? matchedInterestsCount;
  List<String>? matchedInterests;
  List<dynamic>? friends; // Changed from List<Null> to List<dynamic>
  String? relationShip;
  String? body;
  int? children;
  String? height;
  String? about;

  UserData(
      {this.sId,
        this.language,
        this.professional,
        this.nationality,
        this.education,
        this.location,
        this.authId,
        this.profileImage,
        this.address,
        this.post,
        this.createdAt,
        this.updatedAt,
        this.interests,
        this.matchedInterestsCount,
        this.matchedInterests,
        this.friends,
        this.relationShip,
        this.body,
        this.children,
        this.height,
        this.about});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    language = json['language'];
    professional = json['professional'];
    nationality = json['nationality'];
    education = json['education'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    authId = json['authId'] != null ? AuthId.fromJson(json['authId']) : null;
    profileImage = json['profileImage'] != null ? ProfileImage.fromJson(json['profileImage']) : null;
    address = json['address'];

    // Use dynamic instead of Null
    post = json['post']?.cast<dynamic>();

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    interests = json['interests']?.cast<String>();
    matchedInterestsCount = json['matchedInterestsCount'];
    matchedInterests = json['matchedInterests']?.cast<String>();

    // Use dynamic instead of Null
    friends = json['friends']?.cast<dynamic>();

    relationShip = json['relationShip'];
    body = json['body'];
    children = json['children'];
    height = json['height'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['_id'] = this.sId;
    dataMap['language'] = this.language;
    dataMap['professional'] = this.professional;
    dataMap['nationality'] = this.nationality;
    dataMap['education'] = this.education;
    if (this.location != null) {
      dataMap['location'] = this.location!.toJson();
    }
    if (this.authId != null) {
      dataMap['authId'] = this.authId!.toJson();
    }
    if (this.profileImage != null) {
      dataMap['profileImage'] = this.profileImage!.toJson();
    }
    dataMap['address'] = this.address;

    if (this.post != null) {
      dataMap['post'] = this.post; // Assuming post doesn't need to be converted
    }
    dataMap['createdAt'] = this.createdAt;
    dataMap['updatedAt'] = this.updatedAt;
    dataMap['interests'] = this.interests;
    dataMap['matchedInterestsCount'] = this.matchedInterestsCount;
    dataMap['matchedInterests'] = this.matchedInterests;

    if (this.friends != null) {
      dataMap['friends'] = this.friends; // Assuming friends doesn't need to be converted
    }
    dataMap['relationShip'] = this.relationShip;
    dataMap['body'] = this.body;
    dataMap['children'] = this.children;
    dataMap['height'] = this.height;
    dataMap['about'] = this.about;
    return dataMap;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates']?.cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['type'] = this.type;
    dataMap['coordinates'] = this.coordinates;
    return dataMap;
  }
}

class AuthId {
  String? sId;
  String? firstName;
  String? lastName;
  int? age;
  String? gender; // Changed Null to String
  String? email;
  String? role;
  bool? isActive;
  bool? isVerified;
  bool? isCompleted;
  List<String>? deviceTokens; // Changed Null to List<String>
  bool? online;
  String? profileId;
  String? createdAt;
  String? updatedAt;

  AuthId({
    this.sId,
    this.firstName,
    this.lastName,
    this.age,
    this.gender,
    this.email,
    this.role,
    this.isActive,
    this.isVerified,
    this.isCompleted,
    this.deviceTokens,
    this.online,
    this.profileId,
    this.createdAt,
    this.updatedAt,
  });

  AuthId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    role = json['role'];
    isActive = json['isActive'];
    isVerified = json['isVerified'];
    isCompleted = json['isCompleted'];
    deviceTokens = json['deviceTokens']?.cast<String>(); // Changed Null to List<String>
    online = json['online'];
    profileId = json['profileId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {};
    dataMap['_id'] = this.sId;
    dataMap['firstName'] = this.firstName;
    dataMap['lastName'] = this.lastName;
    dataMap['age'] = this.age;
    dataMap['gender'] = this.gender;
    dataMap['email'] = this.email;
    dataMap['role'] = this.role;
    dataMap['isActive'] = this.isActive;
    dataMap['isVerified'] = this.isVerified;
    dataMap['isCompleted'] = this.isCompleted;
    dataMap['deviceTokens'] = this.deviceTokens;
    dataMap['online'] = this.online;
    dataMap['profileId'] = this.profileId;
    dataMap['createdAt'] = this.createdAt;
    dataMap['updatedAt'] = this.updatedAt;
    return dataMap;
  }
}

class ProfileImage {
  String? sId;
  String? file;
  String? fileType;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProfileImage(
      {
        this.sId,
        this.file,
        this.fileType,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    file = json['file'];
    fileType = json['fileType'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['file'] = this.file;
    data['fileType'] = this.fileType;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
