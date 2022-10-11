import 'package:solution_ke/data/models/updateProfile/profile_response.dart';

import '/core/app_export.dart';
import 'package:solution_ke/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  RxBool tos = false.obs;

  ProfileResponse userProfileResponse = ProfileResponse();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void register(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().register(
        headers: {
          'Content-Type': 'application/json',
        },
        onSuccess: (resp) {
          onCreateRegisterSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreateRegisterError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onCreateRegisterSuccess(var response) {
    userProfileResponse = ProfileResponse.fromJson(response);
  }

  void onCreateRegisterError(var err) {
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
