class PostRegisterResp {
  String? status;
  String? message;
  Data? data;

  PostRegisterResp({this.status, this.message, this.data});

  PostRegisterResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  int? id;
  String? username;
  String? email;
  String? name;
  String? nationalId;
  String? kraPin;
  int? userType;
  String? mobileNo;
  String? updatedAt;
  String? createdAt;
  bool? isActive;
  bool? isDeleted;

  Data(
      {this.id,
      this.username,
      this.email,
      this.name,
      this.nationalId,
      this.kraPin,
      this.userType,
      this.mobileNo,
      this.updatedAt,
      this.createdAt,
      this.isActive,
      this.isDeleted});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    name = json['name'];
    nationalId = json['nationalId'];
    kraPin = json['kraPin'];
    userType = json['userType'];
    mobileNo = json['mobileNo'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.username != null) {
      data['username'] = this.username;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.name != null) {
      data['name'] = this.name;
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
    if (this.updatedAt != null) {
      data['updatedAt'] = this.updatedAt;
    }
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt;
    }
    if (this.isActive != null) {
      data['isActive'] = this.isActive;
    }
    if (this.isDeleted != null) {
      data['isDeleted'] = this.isDeleted;
    }
    return data;
  }
}
