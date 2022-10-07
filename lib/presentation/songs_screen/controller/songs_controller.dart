import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/core/errors/exceptions.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';
import 'package:solution_ke/data/models/playlist/playlist_track_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/data/models/song/songs_response.dart';

class SongsController extends GetxController {
  RxList<Song> songs = <Song>[].obs;
  RxString title = "Songs".obs;

  // 0 - Album, 1 - Playlist, 2 - Category
  RxInt pageType = 0.obs;
  RxInt typeId = 1000.obs;

  @override
  void onInit() {
    super.onInit();
    pageType.value = Get.arguments[NavigationArgs.pageType];
    typeId.value = Get.arguments[NavigationArgs.typeId];

    if (Get.arguments[NavigationArgs.pageType] != null) {
      title.value = Get.arguments[NavigationArgs.pageTitle];
    }
  }

  @override
  void onReady() {
    super.onReady();

    switch (pageType.value) {
      case 0: // Album songs
        var request = {
          "query": {
            "albumId": {"\$eq": typeId.value}
          },
          "options": {
            "include": [
              {"model": "user", "as": "_addedBy"}
            ],
          }
        };

        this.fetchSongs(
          request,
        );
        break;
      case 1: // Playlist
        var request = {
          "query": {
            "playlistId": {"\$eq": typeId.value}
          },
          "options": {
            "include": [
              {"model": "user", "as": "_addedBy"},
              {"model": "song", "as": "_trackId"}
            ],
          }
        };

        this.fetchPlaylistSongs(
          request,
        );
        break;

      case 2: // category
        var request = {
          "query": {
            "categoryId": {"\$eq": typeId.value}
          },
          "options": {
            "include": [
              {"model": "user", "as": "_addedBy"},
              {"model": "album", "as": "_albumId"}
            ],
          }
        };

        this.fetchSongs(
          request,
        );
        break;
      default:
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchPlaylistSongs(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchPlaylistSongs(
        onSuccess: (resp) {
          onFetchPlaylistSongsSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onFetchSongsError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onFetchPlaylistSongsSuccess(var response) {
    List<PlaylistTrack> tracks =
        PlaylistTracksResponse.fromJson(response).data?.data ?? [];

    List<Song> tmpSongs = [];
    tracks.forEach((track) {
      track.song?.artist = track.artist;
      tmpSongs.add(track.song!);
    });

    songs.addAll(tmpSongs);
    update();
  }

  void fetchSongs(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchSongs(
        onSuccess: (resp) {
          onFetchSongsSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onFetchSongsError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onFetchSongsSuccess(var response) {
    songs.value = SongsResponse.fromJson(response).data?.data ?? [];
    update();
  }

  void deletePlaylistTrack(int playlistId, int trackId) async {}

  void onFetchSongsError(var err) {
    if (err is NoInternetException) {
      Get.rawSnackbar(
        messageText: Text(
          '$err',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
