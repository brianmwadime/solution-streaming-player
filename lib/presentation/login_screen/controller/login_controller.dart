import '/core/app_export.dart';
import 'package:solution_ke/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/data/models/sendLoginOtp/post_send_login_otp_resp.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';

class LoginController extends GetxController {
  TextEditingController phoneNumberFieldController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;

  RxBool tos = false.obs;

  PostSendLoginOtpResp postSendLoginOtpResp = PostSendLoginOtpResp();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    phoneNumberFieldController.dispose();
  }

  void requestLoginOtp(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().sendLoginOtp(
        headers: {
          'Content-Type': 'application/json',
        },
        onSuccess: (resp) {
          onCreateSendLoginOtpSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreateSendLoginOtpError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onCreateSendLoginOtpSuccess(var response) {
    postSendLoginOtpResp = PostSendLoginOtpResp.fromJson(response);
  }

  void onCreateSendLoginOtpError(var err) {
    if (err is NoInternetException) {
      Get.rawSnackbar(
        messageText: Text(
          '$err',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    } else if (err is Map) {
      Get.rawSnackbar(
        messageText: Text(
          err["message"],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
