import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';
import 'package:solution_ke/data/models/orders/orders_response.dart';

import '/core/app_export.dart';

class PurchaseHistoryController extends GetxController {
  Rx<UserOrdersResponse> userOrders = UserOrdersResponse().obs;

  @override
  void onReady() {
    super.onReady();

    var request = {
      "query": {
        "addedBy": {'\$eq': Hive.box('settings').get('id')}
      },
      "options": {
        "include": [
          {"model": "user", "as": "_addedBy"}
        ],
        // "order": [
        //   ["playCount", "DESC"]
        // ],
        "paginate": 30
      }
    };

    fetchPurchaseHistory(request);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchPurchaseHistory(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchPurchaseHistory(
        onSuccess: (resp) {
          onFetchSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onFetchError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onFetchSuccess(var response) {
    this.userOrders.value = UserOrdersResponse.fromJson(response);
    update();
  }

  void deletePlaylistTrack(int playlistId, int trackId) async {}

  void onFetchError(var err) {
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
