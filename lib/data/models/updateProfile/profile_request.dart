class PutUpdateProfileReq {
  String? name;
  String? mobileNo;
  String? username;
  String? email;

  PutUpdateProfileReq({this.name, this.mobileNo, this.username, this.email});

  PutUpdateProfileReq.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileNo = json['mobileNo'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.mobileNo != null) {
      data['mobileNo'] = this.mobileNo;
    }
    if (this.username != null) {
      data['username'] = this.username;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    return data;
  }
}
