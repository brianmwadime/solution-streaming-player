class PostRegisterReq {
  String? username;
  String? password;
  String? email;
  String? name;
  String? nationalId;
  String? kraPin;
  String? mobileNo;

  PostRegisterReq(
      {this.username,
      this.password,
      this.email,
      this.name,
      this.nationalId,
      this.kraPin,
      this.mobileNo});

  PostRegisterReq.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    name = json['name'];
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
