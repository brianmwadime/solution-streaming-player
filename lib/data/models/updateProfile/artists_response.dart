import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/data/models/updateProfile/profile_response.dart';

class ArtistsResponse {
  String? status;
  String? message;
  ArtistData? data;

  ArtistsResponse({this.status, this.message, this.data});

  ArtistsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ArtistData.fromJson(json['data']) : null;
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

class ArtistData {
  List<UserProfile>? data;
  Paginator? paginator;

  ArtistData({this.data, this.paginator});

  ArtistData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserProfile>[];
      json['data'].forEach((v) {
        data!.add(new UserProfile.fromJson(v));
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
