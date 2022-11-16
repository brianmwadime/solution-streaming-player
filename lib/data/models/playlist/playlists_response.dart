import 'playlist_response.dart';

class PlaylistsResponse {
  String? status;
  String? message;
  PlaylistData? data;

  PlaylistsResponse({this.status, this.message, this.data});

  PlaylistsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? PlaylistData.fromJson(json['data']) : null;
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

class PlaylistData {
  List<Playlist>? data;
  Paginator? paginator;

  PlaylistData({this.data, this.paginator});

  PlaylistData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Playlist>[];
      json['data'].forEach((v) {
        data?.add(Playlist.fromJson(v));
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
