import 'dart:convert';

class LoginResponse {
  final bool status;
  final LoginData data;
  final String message;

  LoginResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      data: LoginData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class LoginData {
  final UserData userData;
  final String token;

  LoginData({
    required this.userData,
    required this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      userData: UserData.fromJson(json['UserData']),
      token: json['token'],
    );
  }
}

class UserData {
  final String id;
  final String firstName;
  final String lastName;
  final String? gender;
  final String email;
  final String role;
  final bool isActive;
  final bool isVerified;
  final bool isCompleted;
  final String? deviceTokens;
  final bool online;
  final ProfileId? profileId;

  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.gender,
    required this.email,
    required this.role,
    required this.isActive,
    required this.isVerified,
    required this.isCompleted,
    this.deviceTokens,
    required this.online,
    this.profileId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      email: json['email'],
      role: json['role'],
      isActive: json['isActive'],
      isVerified: json['isVerified'],
      isCompleted: json['isCompleted'],
      deviceTokens: json['deviceTokens'],
      online: json['online'],
      profileId: json['profileId'] != null ? ProfileId.fromJson(json['profileId']) : null,
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
  final List<Post> post;
  final String createdAt;
  final String updatedAt;

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
      post: (json['post'] as List).map((i) => Post.fromJson(i)).toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
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
  final String createdAt;
  final String updatedAt;

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
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Post {
  final String id;
  final String title;
  final String user;
  final List<dynamic> postMedia;
  final List<dynamic> viewedBy;
  final List<dynamic> userLikes;
  final List<dynamic> userComments;
  final bool isDeleted;
  final List<dynamic> reportUsers;
  final String createdAt;
  final String updatedAt;

  Post({
    required this.id,
    required this.title,
    required this.user,
    required this.postMedia,
    required this.viewedBy,
    required this.userLikes,
    required this.userComments,
    required this.isDeleted,
    required this.reportUsers,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      title: json['title'],
      user: json['user'],
      postMedia: json['postMedia'],
      viewedBy: json['viewedBy'],
      userLikes: json['userLikes'],
      userComments: json['userComments'],
      isDeleted: json['isDeleted'],
      reportUsers: json['reportUsers'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
