import 'package:solution_ke/data/models/releases/releases_response.dart';

import '/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';

class ReleaseController extends GetxController {
  RxList<Release> list = <Release>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    Map newRequest = {
      "options": {
        "include": [
          {"model": "album", "as": "_albumId"},
          {"model": "song", "as": "_songId"}
        ],
        "order": [
          ["id", "DESC"]
        ],
        "paginate": 10
      }
    };

    this.fetchNewReleases(newRequest);
  }

  @override
  void onClose() {
    super.onClose();
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
          onListError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onFetchReleasesSuccess(var response) {
    list.value = ReleasesResponse.fromJson(response).data?.data ?? [];
    update();
  }

  void onListError(var err) {
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
