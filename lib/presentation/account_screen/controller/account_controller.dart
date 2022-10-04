import 'package:flutter/material.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';

import '/core/app_export.dart';
import 'package:solution_ke/presentation/account_screen/models/account_model.dart';

class AccountController extends GetxController {
  Rx<AccountModel> accountModelObj = AccountModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logout({VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().logout(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Get.find<PrefUtils>().getToken()}',
        },
        onSuccess: (resp) {
          onLogoutSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreatePlaylistListError(err);
          if (errCall != null) {
            errCall();
          }
        });
  }

  void onLogoutSuccess(var response) {}

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
}
