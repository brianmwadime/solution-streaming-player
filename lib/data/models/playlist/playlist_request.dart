class PlaylistListRequest {
  Options? options;
  bool? isCountOnly;

  PlaylistListRequest({this.options, this.isCountOnly});

  PlaylistListRequest.fromJson(Map<String, dynamic> json) {
    options =
        json['options'] != null ? Options.fromJson(json['options']) : null;
    isCountOnly = json['isCountOnly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.options != null) {
      data['options'] = this.options?.toJson();
    }
    if (this.isCountOnly != null) {
      data['isCountOnly'] = this.isCountOnly;
    }
    return data;
  }
}

class Options {
  int? page;
  int? paginate;

  Options({this.page, this.paginate});

  Options.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    paginate = json['paginate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.page != null) {
      data['page'] = this.page;
    }
    if (this.paginate != null) {
      data['paginate'] = this.paginate;
    }
    return data;
  }
}
