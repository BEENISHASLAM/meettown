// ignore_for_file: unnecessary_question_mark

class GetFilterUser {
  bool? status;
  List<Data>? data;
  String? message;

  GetFilterUser({this.status, this.data, this.message});
  GetFilterUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? sId;
  String? language;
  String? professional;
  String? nationality;
  String? education;
  Location? location;
  ProfileImage? profileImage;
  String? address;
  List<String>? post;
  String? createdAt;
  String? updatedAt;
  User? user;
  int? matchScore;
  List<String>? friends;

  Data({
    this.sId,
    this.language,
    this.professional,
    this.nationality,
    this.education,
    this.location,
    this.profileImage,
    this.address,
    this.post,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.matchScore,
    this.friends,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    language = json['language'];
    professional = json['professional'];
    nationality = json['nationality'];
    education = json['education'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    profileImage = json['profileImage'] != null ? ProfileImage.fromJson(json['profileImage']) : null;
    address = json['address'];

    // Check if 'post' is not null before casting
    post = json['post'] != null ? List<String>.from(json['post']) : [];

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    matchScore = json['matchScore'];

    // Check if 'friends' is not null before casting
    friends = json['friends'] != null ? List<String>.from(json['friends']) : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = this.sId;
    data['language'] = this.language;
    data['professional'] = this.professional;
    data['nationality'] = this.nationality;
    data['education'] = this.education;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.profileImage != null) {
      data['profileImage'] = this.profileImage!.toJson();
    }
    data['address'] = this.address;
    data['post'] = this.post;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['matchScore'] = this.matchScore;
    data['friends'] = this.friends;
    return data;
  }
}


class Location {
  String? type;
  List<int>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
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
      {this.sId,
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

class User {
  String? sId;
  String? firstName;
  String? lastName;
  int? age;
  Null? gender;
  String? email;
  String? role;
  bool? isActive;
  bool? isVerified;
  bool? isCompleted;
  Null? deviceTokens;
  bool? online;
  String? profileId;
  String? createdAt;
  String? updatedAt;

  User(
      {this.sId,
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
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
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
    deviceTokens = json['deviceTokens'];
    online = json['online'];
    profileId = json['profileId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['role'] = this.role;
    data['isActive'] = this.isActive;
    data['isVerified'] = this.isVerified;
    data['isCompleted'] = this.isCompleted;
    data['deviceTokens'] = this.deviceTokens;
    data['online'] = this.online;
    data['profileId'] = this.profileId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
