import 'package:flutter/material.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';
import 'package:solution_ke/data/models/updateProfile/profile_response.dart';

import '/core/app_export.dart';

typedef SuccessCallback = Function(ProfileResponse data);

class AccountController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void callUpdateUpdateProfile(Map data,
      {SuccessCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().updateProfile(
        onSuccess: (resp) {
          if (successCall != null) {
            successCall(ProfileResponse.fromJson(resp));
          }
        },
        onError: (err) {
          if (errCall != null) {
            errCall();
          }
        },
        requestData: data);
  }

  void logout({VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().logout(onSuccess: (resp) {
      onLogoutSuccess(resp);
      if (successCall != null) {
        successCall();
      }
    }, onError: (err) {
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
