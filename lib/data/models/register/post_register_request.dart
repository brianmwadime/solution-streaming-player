class PostRegisterRequest {
  String? username;
  String? password;
  String? email;
  String? name;
  String? nationalId;
  String? kraPin;
  int userType = 1;
  String? mobileNo;

  PostRegisterRequest(
      {this.username,
      this.password,
      required this.userType,
      this.email,
      this.name,
      this.nationalId,
      this.kraPin,
      this.mobileNo});

  PostRegisterRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    name = json['name'];
    userType = json['userType'];
    nationalId = json['nationalId'];
    kraPin = json['kraPin'];
    mobileNo = json['mobileNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.username != null) {
      data['username'] = this.username;
    }
    if (this.password != null) {
      data['password'] = this.password;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    data['userType'] = this.userType;
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.nationalId != null) {
      data['nationalId'] = this.nationalId;
    }
    if (this.kraPin != null) {
      data['kraPin'] = this.kraPin;
    }
    if (this.mobileNo != null) {
      data['mobileNo'] = this.mobileNo;
    }
    return data;
  }
}
