class PostLoginWithOtpReq {
  String? username;
  String? code;

  PostLoginWithOtpReq({this.username, this.code});

  PostLoginWithOtpReq.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.username != null) {
      data['username'] = this.username;
    }
    if (this.code != null) {
      data['code'] = this.code;
    }
    return data;
  }
}
