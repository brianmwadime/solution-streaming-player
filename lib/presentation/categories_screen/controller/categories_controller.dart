import 'package:solution_ke/data/models/genres/genre_list_response.dart';

import '/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:solution_ke/data/apiClient/api_client.dart';

class CategoriesController extends GetxController {
  RxList<Genre> list = <Genre>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    Map newRequest = {
      "options": {
        "order": [
          ["id", "DESC"]
        ],
        "paginate": 20
      }
    };

    this.fetchCategories(newRequest);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchCategories(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().fetchGenres(
        onSuccess: (resp) {
          onFetchSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onFetchSuccess(var response) {
    list.value = GenreResponse.fromJson(response).data?.data ?? [];
    update();
  }

  void onError(var err) {
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
