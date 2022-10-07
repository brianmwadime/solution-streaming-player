import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/data/models/updateProfile/profile_response.dart';

import 'playlist_response.dart';

class PlaylistTracksResponse {
  String? status;
  String? message;
  PlaylistTracksData? data;

  PlaylistTracksResponse({this.status, this.message, this.data});

  PlaylistTracksResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? PlaylistTracksData.fromJson(json['data']) : null;
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

class PlaylistTracksData {
  List<PlaylistTrack>? data;
  Paginator? paginator;

  PlaylistTracksData({this.data, this.paginator});

  PlaylistTracksData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PlaylistTrack>[];
      json['data'].forEach((v) {
        data?.add(PlaylistTrack.fromJson(v));
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

class PlaylistTrack {
  int? id;
  int? playlistId;
  int? trackId;
  bool? isDeleted;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? addedBy;
  int? updatedBy;
  UserProfile? artist;
  Song? song;

  PlaylistTrack(
      {this.id,
      this.playlistId,
      this.trackId,
      this.isDeleted,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.addedBy,
      this.updatedBy,
      this.artist,
      this.song});

  PlaylistTrack.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playlistId = json['playlistId'];
    trackId = json['trackId'];
    isDeleted = json['isDeleted'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    addedBy = json['addedBy'];
    updatedBy = json['updatedBy'];
    artist = json['_addedBy'] != null
        ? new UserProfile.fromJson(json['_addedBy'])
        : null;
    song =
        json['_trackId'] != null ? new Song.fromJson(json['_trackId']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['playlistId'] = this.playlistId;
    data['trackId'] = this.trackId;
    data['isDeleted'] = this.isDeleted;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['addedBy'] = this.addedBy;
    data['updatedBy'] = this.updatedBy;
    if (this.artist != null) {
      data['_addedBy'] = this.artist!.toJson();
    }
    if (this.song != null) {
      data['_trackId'] = this.song!.toJson();
    }
    return data;
  }
}
