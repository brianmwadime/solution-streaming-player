import 'package:solution_ke/data/apiClient/api_client.dart';
import 'package:solution_ke/data/models/album/albums_response.dart';
import 'package:solution_ke/data/models/genres/genre_list_response.dart';
import 'package:solution_ke/data/models/song/songs_response.dart';
import 'package:solution_ke/presentation/homepage_screen/models/genre_item_model.dart';

import '/core/app_export.dart';
import 'package:solution_ke/presentation/homepage_screen/models/homepage_model.dart';
import 'package:flutter/material.dart';

class HomepageController extends GetxController {
  int? userid = Get.find<PrefUtils>().getUserId();

  TextEditingController searchBarSearController = TextEditingController();

  Rx<HomepageModel> homepageModelObj = HomepageModel().obs;

  AlbumsResponse albumsListResponse = AlbumsResponse();

  GenreResponse genresResponse = GenreResponse();

  @override
  void onReady() {
    super.onReady();

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

    fetchAlbums(albumsRequest,
        successCall: _onOnReadySuccess, errCall: _onOnReadyError);
    fetchCategories({},
        successCall: _onOnCategoriesReadySuccess,
        errCall: _onCategoriesReadyError);

    Map songsRequest = {
      "options": {
        "include": [
          {"model": "user", "as": "_addedBy"}
        ],
        "order": [
          ["playCount", "DESC"]
        ],
        "paginate": 10
      }
    };

    this.fetchSongs(songsRequest, errCall: _onOnReadyError);

    Map newRequest = {
      "options": {
        "include": [
          {"model": "user", "as": "_addedBy"}
        ],
        "order": [
          ["playCount", "DESC"]
        ],
        "paginate": 10
      }
    };

    this.fetchNewReleases(newRequest, errCall: _onOnReadyError);
  }

  @override
  void onClose() {
    super.onClose();
    searchBarSearController.dispose();
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
          onFetchAlbumsError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void fetchNewReleases(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchReleases(
        onSuccess: (resp) {
          onFetchReleasesSuccess(resp);
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

  void onFetchSongsSuccess(var response) {
    homepageModelObj.value.trendingSongs.value =
        SongsResponse.fromJson(response).data?.data ?? [];
    update();
  }

  void onFetchReleasesSuccess(var response) {
    // homepageModelObj.value.releasesList.value =
    //     SongsResponse.fromJson(response).data?.data ?? [];
    update();
  }

  void fetchCategories(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchGenres(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Get.find<PrefUtils>().getToken()}',
        },
        onSuccess: (resp) {
          onFetchCategorySuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onFetchCategoryError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
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
    albumsListResponse = AlbumsResponse.fromJson(response);
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

  void onFetchCategorySuccess(var response) {
    genresResponse = GenreResponse.fromJson(response);
  }

  void onFetchCategoryError(var err) {
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

  void _onOnCategoriesReadySuccess() {
    List<GenreItemModel> list = [];
    if (genresResponse.data?.data != null &&
        genresResponse.data!.data!.isNotEmpty) {
      for (var genre in genresResponse.data?.data ?? []) {
        list.add(GenreItemModel(
          id: genre.id,
          name: genre.name,
        ));
      }
    }
    homepageModelObj.value.categoryItemsList.value = list;
  }

  void _onCategoriesReadyError() {
    Get.snackbar('', albumsListResponse.message ?? "Try later.");
  }

  void _onOnReadySuccess() {
    homepageModelObj.value.albumsItemList.value =
        albumsListResponse.data?.data ?? [];
  }

  void _onOnReadyError() {
    Get.snackbar('', albumsListResponse.message ?? "Try later.");
  }
}
