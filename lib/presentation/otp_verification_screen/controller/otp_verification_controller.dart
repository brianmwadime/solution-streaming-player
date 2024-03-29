import 'package:solution_ke/data/models/updateProfile/profile_response.dart';

import '/core/app_export.dart';
import 'package:solution_ke/presentation/otp_verification_screen/models/otp_verification_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';

class OtpVerificationController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<OtpVerificationModel> otpVerificationModelObj = OtpVerificationModel().obs;

  UserProfile? profile = UserProfile();

  @override
  void codeUpdated() {
    otpController.value.text = code!;
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    unregisterListener();
    cancel();
    super.onClose();
  }

  void callCreateLoginWithOtp(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().loginWithOtp(
        headers: {
          'Content-Type': 'application/json',
        },
        onSuccess: (resp) {
          onCreateLoginWithOtpSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreateLoginWithOtpError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onCreateLoginWithOtpSuccess(var response) {
    profile = ProfileResponse.fromJson(response).data;
  }

  void onCreateLoginWithOtpError(var err) {
    if (err is NoInternetException) {
      // Get.rawSnackbar(
      //   messageText: Text(
      //     '$err',
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      // );
    }
  }
}
