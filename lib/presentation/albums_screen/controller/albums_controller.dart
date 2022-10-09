import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:solution_ke/core/app_export.dart';
import 'package:solution_ke/core/errors/exceptions.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';
import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/album/albums_response.dart';
import 'package:solution_ke/data/models/playlist/playlist_track_response.dart';
import 'package:solution_ke/data/models/song/song_response.dart';
import 'package:solution_ke/data/models/song/songs_response.dart';

class AlbumsController extends GetxController {
  RxList<Album> albums = <Album>[].obs;
  RxString title = "Albums".obs;

  // 0 - Popular, 1 - Albums, 2 - Category
  RxInt pageType = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageType.value = Get.arguments[NavigationArgs.pageType];

    if (Get.arguments[NavigationArgs.pageType] != null) {
      title.value = Get.arguments[NavigationArgs.pageTitle];
    }
  }

  @override
  void onReady() {
    super.onReady();

    switch (pageType.value) {
      case 0: // Popular Albums
        const albumsRequest = {
          "options": {
            "include": [
              {"model": "user", "as": "_addedBy"}
            ],
            "order": [
              ["playCount", "DESC"]
            ],
            "select": [],
            // "page": 1,
            "paginate": 10
          }
        };

        fetchAlbums(albumsRequest, successCall: null, errCall: null);
        break;
      case 1: // Albums

        break;

      case 2: // Albums by Category

        break;
      default:
        break;
    }
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
    albums.value = AlbumsResponse.fromJson(response).data?.data ?? [];
    update();
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
}
