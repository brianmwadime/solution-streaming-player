import 'package:solution_ke/data/models/paginator.dart';

class GenreResponse {
  String? status;
  String? message;
  GenreData? data;

  GenreResponse({this.status, this.message, this.data});

  GenreResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? GenreData.fromJson(json['data']) : null;
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

class GenreData {
  List<Genre>? data;
  Paginator? paginator;

  GenreData({this.data, this.paginator});

  GenreData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Genre>[];
      json['data'].forEach((v) {
        data?.add(Genre.fromJson(v));
      });
    }
    paginator = json['paginator'] != null
        ? Paginator.fromJson(json['paginator'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    if (this.paginator != null) {
      data['paginator'] = this.paginator?.toJson();
    }
    return data;
  }
}

class Genre {
  int? id;
  String? name;
  int? parentId;
  String? description;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? addedBy;
  int? updatedBy;
  bool? isDeleted;

  Genre(
      {this.id,
      this.name,
      this.parentId,
      this.description,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.addedBy,
      this.updatedBy,
      this.isDeleted});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parentId'];
    description = json['description'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    addedBy = json['addedBy'];
    updatedBy = json['updatedBy'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.parentId != null) {
      data['parentId'] = this.parentId;
    }
    if (this.description != null) {
      data['description'] = this.description;
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
    if (this.isDeleted != null) {
      data['isDeleted'] = this.isDeleted;
    }
    return data;
  }
}
