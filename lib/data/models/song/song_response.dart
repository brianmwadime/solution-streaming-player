import 'package:solution_ke/data/models/updateProfile/profile_response.dart';

class SongResponse {
  String? status;
  String? message;
  Song? data;

  SongResponse({this.status, this.message, this.data});

  SongResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Song.fromJson(json['data']) : null;
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

class Song {
  int? id;
  String? name;
  String? filePath;
  int? trackLength;
  int? categoryId;
  int? albumId;
  bool? isDeleted;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? addedBy;
  UserProfile? artist;
  int? updatedBy;
  int? fileType;
  String? artwork;
  String? basePrice;
  String? thanksNote;
  bool? tosAccepted;

  Song(
      {this.id,
      this.name,
      this.filePath,
      this.trackLength,
      this.categoryId,
      this.albumId,
      this.isDeleted,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.addedBy,
      this.artist,
      this.updatedBy,
      this.fileType,
      this.artwork,
      this.basePrice,
      this.thanksNote,
      this.tosAccepted});

  Song.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    filePath = json['filePath'];
    trackLength = json['trackLength'];
    categoryId = json['categoryId'];
    albumId = json['albumId'];
    isDeleted = json['isDeleted'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    addedBy = json['addedBy'];
    artist = json['_addedBy'] != null
        ? UserProfile.fromJson(json['_addedBy'])
        : null;
    updatedBy = json['updatedBy'];
    fileType = json['fileType'];
    artwork = json['artwork'];
    basePrice = json['basePrice'];
    thanksNote = json['thanksNote'];
    tosAccepted = json['tosAccepted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.filePath != null) {
      data['filePath'] = this.filePath;
    }
    if (this.trackLength != null) {
      data['trackLength'] = this.trackLength;
    }
    if (this.categoryId != null) {
      data['categoryId'] = this.categoryId;
    }
    if (this.albumId != null) {
      data['albumId'] = this.albumId;
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

    if (this.artist != null) {
      data['artist'] = this.artist?.toJson();
    }

    if (this.updatedBy != null) {
      data['updatedBy'] = this.updatedBy;
    }
    if (this.fileType != null) {
      data['fileType'] = this.fileType;
    }
    if (this.artwork != null) {
      data['artwork'] = this.artwork;
    }
    if (this.basePrice != null) {
      data['basePrice'] = this.basePrice;
    }
    if (this.thanksNote != null) {
      data['thanksNote'] = this.thanksNote;
    }
    if (this.tosAccepted != null) {
      data['tosAccepted'] = this.tosAccepted;
    }
    return data;
  }
}
