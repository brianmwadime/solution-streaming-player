import 'package:solution_ke/data/models/album/album_response.dart';
import 'package:solution_ke/data/models/album/albums_response.dart';
import 'package:solution_ke/data/models/song/songs_response.dart';

import '/core/app_export.dart';
import 'package:solution_ke/presentation/album_screen/models/album_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';

class AlbumController extends GetxController {
  Album? album;

  Rx<AlbumModel> albumModelObj = AlbumModel().obs;

  AlbumsResponse moreByArtistRespose = AlbumsResponse();

  SongsResponse songsResponse = SongsResponse();

  @override
  void onInit() {
    super.onInit();
    this.album = Get.arguments[NavigationArgs.album];
    this.albumModelObj.value.album?.value = Get.arguments[NavigationArgs.album];
    update();
  }

  @override
  void onReady() {
    super.onReady();

    if (this.album != null) {
      albumModelObj.value.album?.value = this.album!;
    }

    if (this.album?.artist != null) {
      albumModelObj.value.artist?.value = this.album!.artist!;
    }

    Map songsRequest = {
      "query": {
        "albumId": {"\$eq": this.album?.id}
      },
      "options": {
        "include": [
          {"model": "user", "as": "_addedBy"}
        ],
      }
    };

    this.fetchSongs(songsRequest,
        successCall: _onSongsReadySuccess, errCall: _onOnReadyError);

    Map moreAlbumsRequest = {
      "query": {
        "id": {"\$ne": this.album?.id},
        "addedBy": {"\$eq": this.album?.addedBy}
      },
      "options": {
        "include": [
          {"model": "user", "as": "_addedBy"}
        ],
      }
    };

    this.fetchAlbumList(moreAlbumsRequest,
        successCall: _onMoreByArtistSuccess, errCall: _onMoreByArtistError);
  }

  @override
  void onClose() {
    super.onClose();
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
    songsResponse = SongsResponse.fromJson(response);
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

  void _onSongsReadySuccess() {
    albumModelObj.value.songsList.value = songsResponse.data?.data ?? [];
  }

  void fetchAlbumList(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchAlbums(
        onSuccess: (resp) {
          onAlbumListSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onAlbumListError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onAlbumListSuccess(var response) {
    moreByArtistRespose = AlbumsResponse.fromJson(response);
  }

  void _onMoreByArtistSuccess() {
    albumModelObj.value.moreByArtistList.value =
        moreByArtistRespose.data?.data ?? [];
  }

  void _onMoreByArtistError() {}

  void onAlbumListError(var err) {
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

  void _onOnReadyError() {}
}
