class OTP {
  bool? status;
  Data? data;
  String? message;

  OTP({this.status, this.data, this.message});

  OTP.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    data['token'] = this.token;
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
  Null? profileId;
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
