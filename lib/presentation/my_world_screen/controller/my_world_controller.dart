import '/core/app_export.dart';
import 'package:solution_ke/presentation/my_world_screen/models/my_world_model.dart';
import 'package:solution_ke/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/data/models/playlist/playlist_response.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';
import 'package:solution_ke/data/models/playlist/playlist_request.dart';
import '../models/listavatar_eight_item_model.dart';

class MyWorldController extends GetxController {
  Rx<MyWorldModel> myWorldModelObj = MyWorldModel().obs;

  Rx<BottomBarEnum> type = BottomBarEnum.Home.obs;

  PlaylistResponse playlistListResponse = PlaylistResponse();

  @override
  void onReady() {
    super.onReady();
    PlaylistListRequest postPlaylistListReq = PlaylistListRequest();
    this.fetchPlaylistList(
      postPlaylistListReq.toJson(),
      successCall: _onOnReadySuccess,
      errCall: _onOnReadyError,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchPlaylistList(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchPlaylists(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Get.find<PrefUtils>().getToken()}',
        },
        onSuccess: (resp) {
          onCreatePlaylistListSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreatePlaylistListError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onCreatePlaylistListSuccess(var response) {
    playlistListResponse = PlaylistResponse.fromJson(response);
  }

  void onCreatePlaylistListError(var err) {
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

  void _onOnReadySuccess() {
    List<ListavatarEightItemModel> listavatarEightItemModelList = [];
    if (playlistListResponse.data!.data! != null &&
        playlistListResponse.data!.data!.isNotEmpty) {
      for (var element in playlistListResponse.data!.data!) {
        var listavatarEightItemModel = ListavatarEightItemModel();
        listavatarEightItemModelList.add(listavatarEightItemModel);
      }
    }
    myWorldModelObj.value.listavatarEightItemList.value =
        listavatarEightItemModelList;
  }

  void _onOnReadyError() {
    Get.snackbar('', playlistListResponse.message!.toString());
  }
}
