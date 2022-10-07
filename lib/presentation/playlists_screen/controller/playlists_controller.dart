import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_ke/core/errors/exceptions.dart';
import 'package:solution_ke/core/utils/pref_utils.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';
import 'package:solution_ke/data/models/playlist/playlist_response.dart';
import 'package:solution_ke/data/models/playlist/playlists_response.dart';

class PlaylistsController extends GetxController {
  RxList<Playlist> playlists = <Playlist>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    var playlistRequest = {
      "query": {
        "addedBy": {"\$eq": Get.find<PrefUtils>().getUserId()}
      },
      "options": {
        "include": [
          {"model": "user", "as": "_addedBy"}
        ],
      }
    };

    this.fetchPlaylist(
      playlistRequest,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> createPlaylist(dynamic name,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    var request = {"name": name};
    return Get.find<ApiClient>().createPlaylist(
        onSuccess: (resp) {
          onCreatePlaylistSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onPlaylistError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: request);
  }

  Future<void> deletePlaylist(dynamic id,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().deletePlaylist(id, onSuccess: (resp) {
      onDeletePlaylistSuccess(id, resp);
      if (successCall != null) {
        successCall();
      }
    }, onError: (err) {
      onPlaylistError(err);
      if (errCall != null) {
        errCall();
      }
    });
  }

  void onDeletePlaylistSuccess(dynamic id, var response) {
    if (PlaylistResponse.fromJson(response).status == "SUCCESS") {
      playlists.removeWhere((playlist) => playlist.id == id);

      update();
    }
  }

  Future<void> updatePlaylist(dynamic id, dynamic name,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    var request = {"name": name};
    return Get.find<ApiClient>().updatePlaylist(id, onSuccess: (resp) {
      onUpdatePlaylistSuccess(resp);
      if (successCall != null) {
        successCall();
      }
    }, onError: (err) {
      onPlaylistError(err);
      if (errCall != null) {
        errCall();
      }
    }, requestData: request);
  }

  void onCreatePlaylistSuccess(var response) {
    if (PlaylistResponse.fromJson(response).data != null) {
      playlists.add(PlaylistResponse.fromJson(response).data!);
      update();
    }
  }

  void onUpdatePlaylistSuccess(var response) {
    if (PlaylistResponse.fromJson(response).data != null) {
      var updated = PlaylistResponse.fromJson(response).data!;
      List<Playlist> tmpList = [];
      tmpList = playlists.map((playlist) {
        if (playlist.id == updated.id) {
          return updated;
        }
        return playlist;
      }).toList();

      playlists.value = tmpList;
      update();
    }
  }

  void onPlaylistError(var err) {
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

  void fetchPlaylist(Map request,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchPlaylists(
        onSuccess: (resp) {
          onFetchPlaylistSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onFtechPlaylistError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: request);
  }

  void onFetchPlaylistSuccess(var response) {
    playlists.value = PlaylistsResponse.fromJson(response).data?.data ?? [];
    update();
  }

  void onFtechPlaylistError(var err) {
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
