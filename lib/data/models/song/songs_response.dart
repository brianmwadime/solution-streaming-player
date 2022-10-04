import 'package:solution_ke/data/models/album/album_response.dart';

import 'song_response.dart';

class SongsResponse {
  String? status;
  String? message;
  Data? data;

  SongsResponse({this.status, this.message, this.data});

  SongsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  List<Song>? data;
  Paginator? paginator;

  Data({this.data, this.paginator});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Song>[];
      json['data'].forEach((v) {
        data!.add(new Song.fromJson(v));
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
