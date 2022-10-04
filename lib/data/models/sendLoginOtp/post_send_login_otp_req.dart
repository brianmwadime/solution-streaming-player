class PostSendLoginOtpReq {
  String? username;

  PostSendLoginOtpReq({this.username});

  PostSendLoginOtpReq.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.username != null) {
      data['username'] = this.username;
    }
    return data;
  }
}
