class PlaylistResponse {
  String? status;
  String? message;
  Playlist? data;

  PlaylistResponse({this.status, this.message, this.data});

  PlaylistResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Playlist.fromJson(json['data']) : null;
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

class Playlist {
  int? id;
  String? name;
  String? artwork;
  bool? isDeleted;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? addedBy;
  int? updatedBy;

  Playlist(
      {this.id,
      this.name,
      this.artwork,
      this.isDeleted,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.addedBy,
      this.updatedBy});

  Playlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isDeleted = json['isDeleted'];
    isActive = json['isActive'];
    artwork = json['artwork'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    addedBy = json['addedBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.artwork != null) {
      data['artwork'] = this.artwork;
    }
    if (this.isDeleted != null) {
      data['isDeleted'] = this.isDeleted;
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
    return data;
  }
}

class Paginator {
  int? itemCount;
  int? perPage;
  int? pageCount;
  int? currentPage;

  Paginator({this.itemCount, this.perPage, this.pageCount, this.currentPage});

  Paginator.fromJson(Map<String, dynamic> json) {
    itemCount = json['itemCount'];
    perPage = json['perPage'];
    pageCount = json['pageCount'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.itemCount != null) {
      data['itemCount'] = this.itemCount;
    }
    if (this.perPage != null) {
      data['perPage'] = this.perPage;
    }
    if (this.pageCount != null) {
      data['pageCount'] = this.pageCount;
    }
    if (this.currentPage != null) {
      data['currentPage'] = this.currentPage;
    }
    return data;
  }
}
