import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';

class ReleasesResponse {
  String? status;
  String? message;
  ReleasesData? data;

  ReleasesResponse({this.status, this.message, this.data});

  ReleasesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? new ReleasesData.fromJson(json['data']) : null;
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

class ReleasesData {
  List<Release>? data;
  Paginator? paginator;

  ReleasesData({this.data, this.paginator});

  ReleasesData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Release>[];
      json['data'].forEach((v) {
        data!.add(new Release.fromJson(v));
      });
    }
    paginator = json['paginator'] != null
        ? new Paginator.fromJson(json['paginator'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.paginator != null) {
      data['paginator'] = this.paginator!.toJson();
    }
    return data;
  }
}

class Release {
  int? id;
  int? albumId;
  int? songId;
  String? type;
  bool? isDeleted;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? addedBy;
  int? updatedBy;
  Album? album;
  Song? song;

  Release(
      {this.id,
      this.albumId,
      this.songId,
      this.type,
      this.isDeleted,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.addedBy,
      this.updatedBy,
      this.album,
      this.song});

  Release.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    albumId = json['albumId'];
    songId = json['songId'];
    type = json['type'];
    isDeleted = json['isDeleted'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    addedBy = json['addedBy'];
    updatedBy = json['updatedBy'];
    album =
        json['_albumId'] != null ? new Album.fromJson(json['_albumId']) : null;
    song = json['_songId'] != null ? new Song.fromJson(json['_songId']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['albumId'] = this.albumId;
    data['songId'] = this.songId;
    data['type'] = this.type;
    data['isDeleted'] = this.isDeleted;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['addedBy'] = this.addedBy;
    data['updatedBy'] = this.updatedBy;
    if (this.album != null) {
      data['_albumId'] = this.album!.toJson();
    }
    if (this.song != null) {
      data['_songId'] = this.song!.toJson();
    }
    return data;
  }
}
