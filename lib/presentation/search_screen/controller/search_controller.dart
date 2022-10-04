import 'package:flutter/material.dart';
import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';
import 'package:solution_ke/data/models/album/albums_response.dart';
import 'package:solution_ke/data/models/playlist/playlist_response.dart';
import 'package:solution_ke/data/models/song/songs_response.dart';

class SearchController extends GetxController {
  final searchController = TextEditingController();
  RxString query = "".obs;
  Rx<bool> fromHome = false.obs;
  Rx<bool> autofocus = true.obs;

  RxMap<String, dynamic> searchedData = <String, dynamic>{}.obs;

  RxMap<int, String> position = <int, String>{}.obs;

  RxList sortedKeys = [].obs;

  @override
  void onReady() {
    super.onReady();

    position[0] = "Albums";
    position[1] = "Playlists";
    position[3] = "Songs";
    position[4] = "Artists";
  }

  void searchAlbums(String? query) {
    Map request = {
      "query": {
        "name": {"\$like": "%$query%"}
      },
      "options": {"page": 1, "paginate": 10}
    };

    fetchAlbums(request);
  }

  void searchPlaylists(String? query) {
    Map request = {
      "query": {
        "name": {"\$like": "%$query%"}
      },
      "options": {"page": 1, "paginate": 10}
    };

    fetchPlaylists(request);
  }

  void searchSongs(String? query) {
    Map request = {
      "query": {
        "name": {"\$like": "%$query%"}
      },
      "options": {"page": 1, "paginate": 10}
    };

    fetchSongs(request);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchAlbums(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchAlbums(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Get.find<PrefUtils>().getToken()}',
        },
        onSuccess: (resp) {
          onFetchAlbumsSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onFetchAlbumsError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onFetchAlbumsSuccess(var response) {
    if ((AlbumsResponse.fromJson(response).data?.data ?? []).isNotEmpty) {
      searchedData['Albums'] =
          AlbumsResponse.fromJson(response).data?.data ?? [];
      update();
    }
  }

  void onFetchAlbumsError(var err) {
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
    if ((SongsResponse.fromJson(response).data?.data ?? []).isNotEmpty) {
      searchedData['Songs'] = SongsResponse.fromJson(response).data?.data ?? [];
      update();
    }
  }

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

  void fetchPlaylists(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchPlaylists(
        onSuccess: (resp) {
          onFetchPlaylistsSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onFetchPlaylistsError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onFetchPlaylistsSuccess(var response) {
    if ((PlaylistResponse.fromJson(response).data?.data ?? []).isNotEmpty) {
      searchedData['Playlists'] =
          PlaylistResponse.fromJson(response).data?.data ?? [];
      update();
    }
  }

  void onFetchPlaylistsError(var err) {
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
