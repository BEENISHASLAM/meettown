
import 'dart:convert';
class User {
  final String firstName;
  final String lastName;
  final int age;
  final String? gender;
  final String email;
  final String password;
  final String role;
  final bool isActive;
  final bool isVerified;
  final bool isCompleted;
  final String? deviceTokens;
  final bool online;
  final String? profileId;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  User({
    required this.firstName,
    required this.lastName,
    required this.age,
    this.gender,
    required this.email,
    required this.password,
    required this.role,
    required this.isActive,
    required this.isVerified,
    required this.isCompleted,
    this.deviceTokens,
    required this.online,
    this.profileId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      gender: json['gender'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      isActive: json['isActive'],
      isVerified: json['isVerified'],
      isCompleted: json['isCompleted'],
      deviceTokens: json['deviceTokens'],
      online: json['online'],
      profileId: json['profileId'],
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'gender': gender,
      'email': email,
      'password': password,
      'role': role,
      'isActive': isActive,
      'isVerified': isVerified,
      'isCompleted': isCompleted,
      'deviceTokens': deviceTokens,
      'online': online,
      'profileId': profileId,
      '_id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

// ApiResponse model
class ApiResponse {
  final bool status;
  final Data data;
  final String message;

  ApiResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      data: Data.fromJson(json['data']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
      'message': message,
    };
  }
}

class Data {
  final User user;
  final int otp;
  final String token;

  Data({
    required this.user,
    required this.otp,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User.fromJson(json['user']),
      otp: json['otp'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'otp': otp,
      'token': token,
    };
  }
}
