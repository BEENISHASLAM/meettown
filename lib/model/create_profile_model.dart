import 'dart:convert';

class ProfileCreate {
  final bool status;
  final UserData data;
  final String message;

  ProfileCreate({
    required this.status,
    required this.data,
    required this.message,
  });

  factory ProfileCreate.fromJson(Map<String, dynamic> json) {
    return ProfileCreate(
      status: json['status'],
      data: UserData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class UserData {
  final User user;
  final String token;

  UserData({
    required this.user,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['User']),
      token: json['token'],
    );
  }
}

class User {
  final String id;
  final String firstName;
  final String lastName;
  final int age;
  final String? gender;
  final String email;
  final String role;
  final bool isActive;
  final bool isVerified;
  final bool isCompleted;
  final String? deviceTokens;
  final bool online;
  final ProfileId? profileId;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    this.gender,
    required this.email,
    required this.role,
    required this.isActive,
    required this.isVerified,
    required this.isCompleted,
    this.deviceTokens,
    required this.online,
    this.profileId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      gender: json['gender'],
      email: json['email'],
      role: json['role'],
      isActive: json['isActive'],
      isVerified: json['isVerified'],
      isCompleted: json['isCompleted'],
      deviceTokens: json['deviceTokens'],
      online: json['online'],
      profileId: json['profileId'] != null ? ProfileId.fromJson(json['profileId']) : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class ProfileId {
  final Location location;
  final String id;
  final String language;
  final String professional;
  final String nationality;
  final String education;
  final String authId;
  final ProfileImage? profileImage;
  final String address;
  final List<dynamic> post;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProfileId({
    required this.location,
    required this.id,
    required this.language,
    required this.professional,
    required this.nationality,
    required this.education,
    required this.authId,
    this.profileImage,
    required this.address,
    required this.post,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProfileId.fromJson(Map<String, dynamic> json) {
    return ProfileId(
      location: Location.fromJson(json['location']),
      id: json['_id'],
      language: json['language'],
      professional: json['professional'],
      nationality: json['nationality'],
      education: json['education'],
      authId: json['authId'],
      profileImage: json['profileImage'] != null ? ProfileImage.fromJson(json['profileImage']) : null,
      address: json['address'],
      post: json['post'] as List<dynamic>,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      coordinates: (json['coordinates'] as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
    );
  }
}

class ProfileImage {
  final String id;
  final String file;
  final String fileType;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProfileImage({
    required this.id,
    required this.file,
    required this.fileType,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) {
    return ProfileImage(
      id: json['_id'],
      file: json['file'],
      fileType: json['fileType'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
