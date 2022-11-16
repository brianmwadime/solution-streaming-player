import 'package:get/get.dart';
import 'package:solution_ke/data/models/updateProfile/profile_response.dart';

import '../../apiClient/api_client.dart';

class AlbumResponse {
  String? status;
  String? message;
  Album? data;

  AlbumResponse({this.status, this.message, this.data});

  AlbumResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Album.fromJson(json['data']) : null;
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

class Album {
  String? name;
  String? artwork;
  int? songCount;
  String? year;
  bool? tosAccepted;
  String? thanksNote;
  int? id;
  int? addedBy;
  bool? isDeleted;
  UserProfile? artist;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? basePrice;

  Album(
      {this.name,
      this.artwork,
      this.songCount,
      this.tosAccepted,
      this.thanksNote,
      this.year,
      this.id,
      this.isDeleted,
      this.addedBy,
      this.isActive,
      this.createdAt,
      this.artist,
      this.basePrice,
      this.updatedAt});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    artwork = json['artwork'] != null
        ? Get.find<ApiClient>().url + json['artwork']
        : null;
    songCount = json['songCount'];
    year = json['year'];
    tosAccepted = json['tosAccepted'];
    thanksNote = json['thanksNote'];
    id = json['id'];
    addedBy = json['addedBy'];
    artist = json['_addedBy'] != null
        ? UserProfile.fromJson(json['_addedBy'])
        : null;
    isDeleted = json['isDeleted'];
    basePrice = json['basePrice'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.artwork != null) {
      data['artwork'] = this.artwork;
    }
    if (this.year != null) {
      data['year'] = this.year;
    }
    if (this.songCount != null) {
      data['songCount'] = this.songCount;
    }
    if (this.tosAccepted != null) {
      data['tosAccepted'] = this.tosAccepted;
    }
    if (this.thanksNote != null) {
      data['thanksNote'] = this.thanksNote;
    }
    if (this.id != null) {
      data['id'] = this.id;
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

    if (this.addedBy != null) {
      data['addedBy'] = this.addedBy;
    }

    if (this.basePrice != null) {
      data['basePrice'] = this.basePrice;
    }

    if (this.artist != null) {
      data['artist'] = this.artist?.toJson();
    }

    if (this.updatedAt != null) {
      data['updatedAt'] = this.updatedAt;
    }
    return data;
  }
}

class Paginator {
  int? currentPage;
  int? itemCount;
  int? pageCount;
  int? perPage;

  Paginator({this.currentPage, this.itemCount, this.pageCount, this.perPage});

  Paginator.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    itemCount = json['itemCount'];
    pageCount = json['pageCount'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.currentPage != null) {
      data['currentPage'] = this.currentPage;
    }
    if (this.itemCount != null) {
      data['itemCount'] = this.itemCount;
    }
    if (this.pageCount != null) {
      data['pageCount'] = this.pageCount;
    }
    if (this.perPage != null) {
      data['perPage'] = this.perPage;
    }
    return data;
  }
}
