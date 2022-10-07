import 'package:solution_ke/data/models/playlist/playlist_response.dart';

import '/core/app_export.dart';
import 'package:solution_ke/presentation/my_world_screen/models/my_world_model.dart';
import 'package:solution_ke/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/data/models/playlist/playlists_response.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';

class MyWorldController extends GetxController {
  Rx<MyWorldModel> myWorldModelObj = MyWorldModel().obs;

  Rx<BottomBarEnum> type = BottomBarEnum.Home.obs;

  PlaylistsResponse playlistListResponse = PlaylistsResponse();

  RxList<Playlist> playlists = <Playlist>[].obs;

  RxList<dynamic> purchased = <dynamic>[].obs;

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
          onFetchPlaylistError(err);
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

  void onFetchPlaylistError(var err) {
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
