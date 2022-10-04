import '/core/app_export.dart';
import 'package:solution_ke/presentation/onboarding_category_screen/models/onboarding_category_model.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/data/models/genres/genre_list_response.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';
import 'package:solution_ke/data/models/genres/post_category_list_req.dart';
import '../models/category_item_model.dart';

class OnboardingCategoryController extends GetxController {
  Rx<OnboardingCategoryModel> onboardingCategoryModelObj =
      OnboardingCategoryModel().obs;

  GenreResponse postCategoryListResp = GenreResponse();

  @override
  void onReady() {
    super.onReady();
    PostCategoryListReq postCategoryListReq = PostCategoryListReq();
    this.callCreateCategoryList(
      postCategoryListReq.toJson(),
      successCall: _onOnReadySuccess,
      errCall: _onOnReadyError,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  void callCreateCategoryList(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchGenres(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Get.find<PrefUtils>().getToken()}',
        },
        onSuccess: (resp) {
          onCreateCategoryListSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreateCategoryListError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onCreateCategoryListSuccess(var response) {
    postCategoryListResp = GenreResponse.fromJson(response);
  }

  void onCreateCategoryListError(var err) {
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
    List<OnboardingCategoryItemModel> categoryItemModelList = [];
    if (postCategoryListResp.data?.data != null &&
        postCategoryListResp.data!.data!.isNotEmpty) {
      for (var element in postCategoryListResp.data!.data!) {
        var categoryItemModel = OnboardingCategoryItemModel();
        categoryItemModel.labelTxt.value = element.name!.toString();
        categoryItemModelList.add(categoryItemModel);
      }
    }
    onboardingCategoryModelObj.value.categoryItemList.value =
        categoryItemModelList;
  }

  void _onOnReadyError() {
    Get.snackbar('', postCategoryListResp.message!.toString());
  }
}
