class PostListReq {
  Options? options;
  bool? isCountOnly;

  PostListReq({this.options, this.isCountOnly});

  PostListReq.fromJson(Map<String, dynamic> json) {
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
  List<String>? select;
  int? page;
  int? paginate;

  Options({this.select, this.page, this.paginate});

  Options.fromJson(Map<String, dynamic> json) {
    select = json['select'].cast<String>();
    page = json['page'];
    paginate = json['paginate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.select != null) {
      data['select'] = this.select;
    }
    if (this.page != null) {
      data['page'] = this.page;
    }
    if (this.paginate != null) {
      data['paginate'] = this.paginate;
    }
    return data;
  }
}
