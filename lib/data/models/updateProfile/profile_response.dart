import 'package:get/get.dart';

import '../../apiClient/api_client.dart';

class ProfileResponse {
  String? status;
  String? message;
  UserProfile? data;

  ProfileResponse({this.status, this.message, this.data});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserProfile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.status != null) {
      data['status'] = this.status;
    }
    if (this.message != null) {
      data['message'] = this.message;
    }
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class UserProfile {
  int? id;
  String? username;
  String? email;
  String? name;
  String? avatar;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? addedBy;
  int? updatedBy;
  String? nationalId;
  String? kraPin;
  int? userType;
  String? mobileNo;
  bool? isDeleted;
  String? token;

  UserProfile(
      {this.id,
      this.username,
      this.email,
      this.name,
      this.isActive,
      this.avatar,
      this.createdAt,
      this.updatedAt,
      this.addedBy,
      this.updatedBy,
      this.nationalId,
      this.kraPin,
      this.userType,
      this.mobileNo,
      this.isDeleted,
      this.token});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    name = json['name'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    addedBy = json['addedBy'];
    avatar = json['avatar'] != null
        ? Get.find<ApiClient>().url + json['avatar']
        : null;
    updatedBy = json['updatedBy'];
    nationalId = json['nationalId'];
    kraPin = json['kraPin'];
    userType = json['userType'];
    mobileNo = json['mobileNo'];
    isDeleted = json['isDeleted'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.username != null) {
      data['username'] = this.username;
    }
    if (this.avatar != null) {
      data['avatar'] = this.avatar;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.isActive != null) {
      data['isActive'] = this.isActive;
    }
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt;
    }
    if (this.updatedAt != null) {
      data['updatedAt'] = this.updatedAt;
    }
    if (this.addedBy != null) {
      data['addedBy'] = this.addedBy;
    }
    if (this.updatedBy != null) {
      data['updatedBy'] = this.updatedBy;
    }
    if (this.nationalId != null) {
      data['nationalId'] = this.nationalId;
    }
    if (this.kraPin != null) {
      data['kraPin'] = this.kraPin;
    }
    if (this.userType != null) {
      data['userType'] = this.userType;
    }
    if (this.mobileNo != null) {
      data['mobileNo'] = this.mobileNo;
    }
    if (this.isDeleted != null) {
      data['isDeleted'] = this.isDeleted;
    }
    if (this.token != null) {
      data['token'] = this.token;
    }
    return data;
  }
}
