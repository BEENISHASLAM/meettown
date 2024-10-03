class UserProfile {
  bool? status;
  List<Data>? data;
  String? message;

  UserProfile({this.status, this.data, this.message});

  UserProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = (json['data'] as List<dynamic>).map((v) => Data.fromJson(v)).toList();
    } else {
      data = [];
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['status'] = status;
    json['data'] = data?.map((v) => v.toJson()).toList();
    json['message'] = message;
    return json;
  }
}

class Data {
  String? sId;
  String? language;
  String? professional;
  String? nationality;
  String? education;
  ProfileImage? profileImage;
  String? address;
  List<String>? post;
  String? createdAt;
  String? updatedAt;
  List<String>? friends;
  User? user;
  String? distanceKm;
  String? relationShip;

  Data({
    this.sId,
    this.language,
    this.professional,
    this.nationality,
    this.education,
    this.profileImage,
    this.address,
    this.post,
    this.createdAt,
    this.updatedAt,
    this.friends,
    this.user,
    this.distanceKm,
    this.relationShip,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    language = json['language'];
    professional = json['professional'];
    nationality = json['nationality'];
    education = json['education'];
    profileImage = json['profileImage'] != null
        ? ProfileImage.fromJson(json['profileImage'])
        : null;
    address = json['address'];

    // Safe initialization of lists
    post = (json['post'] as List<dynamic>?)?.map((item) => item.toString()).toList();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    friends = (json['friends'] as List<dynamic>?)?.map((item) => item.toString()).toList();
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    distanceKm = json['distanceKm'];
    relationShip = json['relationShip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['_id'] = sId;
    json['language'] = language;
    json['professional'] = professional;
    json['nationality'] = nationality;
    json['education'] = education;
    if (profileImage != null) {
      json['profileImage'] = profileImage!.toJson();
    }
    json['address'] = address;
    json['post'] = post;
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    json['friends'] = friends;
    if (user != null) {
      json['user'] = user!.toJson();
    }
    json['distanceKm'] = distanceKm;
    json['relationShip'] = relationShip;
    return json;
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

  ProfileImage({
    this.sId,
    this.file,
    this.fileType,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

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
    final Map<String, dynamic> json = {};
    json['_id'] = sId;
    json['file'] = file;
    json['fileType'] = fileType;
    json['userId'] = userId;
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    json['__v'] = iV;
    return json;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  int? age;
  String? gender;
  String? email;
  String? role;
  bool? isActive;
  bool? isVerified;
  bool? isCompleted;
  dynamic deviceTokens; // Changed from Null to dynamic to allow null values
  bool? online;
  String? profileId;
  String? createdAt;
  String? updatedAt;

  User({
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
    deviceTokens = json['deviceTokens']; // Allow null
    online = json['online'];
    profileId = json['profileId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['_id'] = sId;
    json['firstName'] = firstName;
    json['lastName'] = lastName;
    json['age'] = age;
    json['gender'] = gender;
    json['email'] = email;
    json['role'] = role;
    json['isActive'] = isActive;
    json['isVerified'] = isVerified;
    json['isCompleted'] = isCompleted;
    json['deviceTokens'] = deviceTokens;
    json['online'] = online;
    json['profileId'] = profileId;
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    return json;
  }
}
