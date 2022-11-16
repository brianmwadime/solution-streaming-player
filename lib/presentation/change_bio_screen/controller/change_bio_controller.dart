import '/core/app_export.dart';
import 'package:solution_ke/presentation/change_bio_screen/models/change_bio_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/data/models/updateProfile/profile_response.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';

class ChangeBioController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController aliasController = TextEditingController();

  Rx<ChangeBioModel> changeBioModelObj = ChangeBioModel().obs;

  ProfileResponse profileResponse = ProfileResponse();

  @override
  void onReady() {
    super.onReady();

    this.callFetchProfile(
      successCall: _onOnReadySuccess,
      errCall: _onOnReadyError,
    );
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    aliasController.dispose();
  }

  void callFetchProfile(
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchProfile(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Get.find<PrefUtils>().getToken()}',
        },
        onSuccess: (resp) {
          onFetchProfileSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onFetchProfileError(err);
          if (errCall != null) {
            errCall();
          }
        });
  }

  void onFetchProfileSuccess(var response) {
    profileResponse = ProfileResponse.fromJson(response);
  }

  void onFetchProfileError(var err) {
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

  void callUpdateUpdateProfile(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().updateProfile(
        headers: {
          'Content-Type': 'application/json',
        },
        onSuccess: (resp) {
          onUpdateProfileSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onUpdateProfileError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onUpdateProfileSuccess(var response) {
    profileResponse = ProfileResponse.fromJson(response);
    nameController.text = profileResponse.data?.name ?? "";
    aliasController.text = profileResponse.data?.username ?? "";
  }

  void onUpdateProfileError(var err) {
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
    nameController.text = profileResponse.data?.name ?? "";
    aliasController.text = profileResponse.data?.username ?? "";
  }

  void _onOnReadyError() {
    Get.snackbar('', profileResponse.message ?? "Try again later.");
  }
}
