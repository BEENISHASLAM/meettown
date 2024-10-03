class UserProfileView {
  bool? status;
  Data? data;
  String? message;

  UserProfileView({this.status, this.data, this.message});

  UserProfileView.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['status'] = status;
    json['data'] = data?.toJson();
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
  String? relationShip;
  String? body;
  int? children;
  String? height;
  AuthId? authId; // New AuthId class
  ProfileImage? profileImage;
  String? address;
  String? about;
  List<dynamic>? interests;
  List<dynamic>? post;
  List<dynamic>? friends;
  String? createdAt;
  String? updatedAt;
  Location? location; // New Location class

  Data({
    this.sId,
    this.language,
    this.professional,
    this.nationality,
    this.education,
    this.relationShip,
    this.body,
    this.children,
    this.height,
    this.authId,
    this.profileImage,
    this.address,
    this.about,
    this.interests,
    this.post,
    this.friends,
    this.createdAt,
    this.updatedAt,
    this.location,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    language = json['language'];
    professional = json['professional'];
    nationality = json['nationality'];
    education = json['education'];
    relationShip = json['relationShip'];
    body = json['body'];
    children = json['children'];
    height = json['height'];
    authId = json['authId'] != null ? AuthId.fromJson(json['authId']) : null;
    profileImage = json['profileImage'] != null ? ProfileImage.fromJson(json['profileImage']) : null;
    address = json['address'];
    about = json['about'];
    interests = json['interests'] ?? [];
    post = json['post'] ?? [];
    friends = json['friends'] ?? [];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null; // New parsing for Location
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['_id'] = sId;
    json['language'] = language;
    json['professional'] = professional;
    json['nationality'] = nationality;
    json['education'] = education;
    json['relationShip'] = relationShip;
    json['body'] = body;
    json['children'] = children;
    json['height'] = height;
    if (authId != null) {
      json['authId'] = authId!.toJson();
    }
    if (profileImage != null) {
      json['profileImage'] = profileImage!.toJson();
    }
    json['address'] = address;
    json['about'] = about;
    json['interests'] = interests;
    json['post'] = post;
    json['friends'] = friends;
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    if (location != null) {
      json['location'] = location!.toJson(); // Serialize Location
    }
    return json;
  }
}

class AuthId {
  String? sId;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? role;
  bool? isActive;
  bool? isVerified;
  bool? isCompleted;
  dynamic deviceTokens; // Allows null
  bool? online;
  String? profileId;
  String? createdAt;
  String? updatedAt;

  AuthId({
    this.sId,
    this.firstName,
    this.lastName,
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
    gender = json['gender'];
    email = json['email'];
    role = json['role'];
    isActive = json['isActive'];
    isVerified = json['isVerified'];
    isCompleted = json['isCompleted'];
    deviceTokens = json['deviceTokens']; // Allows null
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

class Location {
  String? type;
  List<double>? coordinates; // Changed to List<double> for coordinates

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = (json['coordinates'] as List<dynamic>).map((v) => v.toDouble()).cast<double>().toList(); // Ensure double type
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['type'] = type;
    json['coordinates'] = coordinates;
    return json;
  }
}
