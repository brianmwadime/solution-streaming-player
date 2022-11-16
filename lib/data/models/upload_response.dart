class UploadResponse {
  String? status;
  String? message;
  UploadFile? data;

  UploadResponse({this.status, this.message, this.data});

  UploadResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UploadFile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UploadFile {
  UploadFileRes? uploadFileRes;

  UploadFile({this.uploadFileRes});

  UploadFile.fromJson(Map<String, dynamic> json) {
    uploadFileRes = json['uploadFileRes'] != null
        ? new UploadFileRes.fromJson(json['uploadFileRes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uploadFileRes != null) {
      data['uploadFileRes'] = this.uploadFileRes!.toJson();
    }
    return data;
  }
}

class UploadFileRes {
  String? message;
  Upload? data;

  UploadFileRes({this.message, this.data});

  UploadFileRes.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Upload.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Upload {
  List<UploadSuccess>? uploadSuccess;
  List<UploadSuccess>? uploadFailed;

  Upload({this.uploadSuccess, this.uploadFailed});

  Upload.fromJson(Map<String, dynamic> json) {
    if (json['uploadSuccess'] != null) {
      uploadSuccess = <UploadSuccess>[];
      json['uploadSuccess'].forEach((v) {
        uploadSuccess!.add(new UploadSuccess.fromJson(v));
      });
    }
    if (json['uploadFailed'] != null) {
      uploadFailed = <UploadSuccess>[];
      json['uploadFailed'].forEach((v) {
        uploadFailed!.add(new UploadSuccess.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uploadSuccess != null) {
      data['uploadSuccess'] =
          this.uploadSuccess!.map((v) => v.toJson()).toList();
    }
    if (this.uploadFailed != null) {
      data['uploadFailed'] = this.uploadFailed!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UploadSuccess {
  String? name;
  String? path;
  bool? status;

  UploadSuccess({this.name, this.path, this.status});

  UploadSuccess.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    path = json['path'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['path'] = this.path;
    data['status'] = this.status;
    return data;
  }
}
